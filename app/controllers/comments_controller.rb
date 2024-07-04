class CommentsController < ApplicationController
  load_and_authorize_resource

  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :set_post

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        @post.increment!(:total_comments)
        if @post.notify_by_email && @post.user != current_user
          PostUserMailer.notify_user_for_new_comment_on_post(current_user, @comment).deliver_later
        end
        if @post.user != current_user
          Notification.create!(
            user: @post.user,
            title: "#{current_user.full_name} commented on your post",
            content: @comment.content.to_plain_text.truncate(10),
            link: post_path(@post)
          )
        end
        format.html { redirect_to post_path(@post), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        @comments = @post.comments.includes(:user, :votes).with_rich_text_content
        format.html { render 'posts/show', status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@comment.post), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        @comments = @post.comments.includes(:user, :votes).with_rich_text_content
        format.html { render 'posts/show', status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!

    respond_to do |format|
      @post.decrement!(:total_comments)
      format.html { redirect_to post_path(@post), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content, :file)
  end
end
