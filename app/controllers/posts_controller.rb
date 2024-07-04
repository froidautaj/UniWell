class PostsController < ApplicationController
  SORT_BY_OPTIONS = {
    'Active' => { updated_at: :desc },
    'Oldest' => { created_at: :desc },
    'Votes' => { total_upvotes: :desc },
  }.freeze

  before_action :authenticate_user!, except: %i[ index show ]

  load_and_authorize_resource

  before_action :set_post, only: %i[ show edit update destroy mark_as_accepted_comment]
  before_action :set_categories, only: %i[ new edit create update ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all.page(params[:page]).per(10)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post.increment!(:views) if user_signed_in? && @post.user_id != current_user.id
    @comment = Comment.find_by(id: params[:comment_id]) || Comment.new
    sort_by = SORT_BY_OPTIONS[params[:sort_by]] || { created_at: :desc }
    @comments = @post.comments.order(sort_by).includes(:user, :votes).with_rich_text_content
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_as_accepted_comment
    unless current_user == @post.user
      redirect_to post_path(@post), alert: 'You are not allowed to perform this action.' and return
    end

    @comment = @post.comments.find(params[:comment_id])

    if @post.accepted_comment?(@comment)
      @post.update(accepted_comment_id: nil)
    else
      @comment.user.increment_badge
      @post.update!(accepted_comment_id: @comment.id)

      Notification.create!(
        user: @comment.user,
        title: 'Your comment has been accepted as an answer',
        content: @comment.content.to_plain_text.truncate(10),
        link: post_path(@post)
      )
    end

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { render :show, status: :ok, location: @post }
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_categories
    @categories = Category.all.pluck(:name, :id)
  end

  # Only allow a list of trusted parameters through.
  def post_params
    custom_params = params.require(:post).permit(:title, :content, :tags, :category_id, :file, :agree_terms, :notify_by_email)
    custom_params[:tags] = custom_params[:tags].split(',').map(&:strip).uniq
    custom_params
  end
end
