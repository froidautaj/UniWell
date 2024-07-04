class UsersController < AuthController
  def profile
    @user = params[:user_id].present? ? User.find(params[:user_id]) : current_user
    @posts = @user.posts.includes(:comments, :accepted_comment, user: { avatar_attachment: :blob }).with_rich_text_content.all
    @total_posts = @posts.count
    @posts = @posts.order(created_at: :desc).page(params[:page]).per(10)
  end
end
