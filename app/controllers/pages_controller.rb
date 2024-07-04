class PagesController < ApplicationController
  PER_PAGE = 10
  PER_PAGE_OPTIONS = [10, 15, 20, 30, 40, 50].freeze
  SORT_BY_OPTIONS = {
    'Newest' => { created_at: :desc },
    'Votes' => { total_upvotes: :desc },
    'Active' => { updated_at: :desc },
    'Accepted Answer' => 'accepted_comment_id asc NULLS LAST',
  }.freeze

  def home
    per_page = params[:per_page].to_i.in?(PER_PAGE_OPTIONS) ? params[:per_page].to_i : PER_PAGE
    sort_by = SORT_BY_OPTIONS[params[:sort_by]] || { created_at: :desc }

    @posts = Post.includes(:comments, :accepted_comment, user: { avatar_attachment: :blob }).with_rich_text_content.all
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id].present?
    if params[:query].present?
      @posts = @posts.joins(:category, :action_text_rich_text)
                     .where('title ILIKE :query OR categories.name ILIKE :query OR action_text_rich_texts.body ILIKE :query', query: "%#{params[:query]}%")
    end
    @total_posts = @posts.count
    @posts = @posts.order(sort_by).page(params[:page]).per(per_page)
  end

  def user_policies; end

  def faq; end

  def support_page
    @support = Support.new
  end
end
