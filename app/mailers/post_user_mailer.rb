class PostUserMailer < ApplicationMailer

  def notify_user_for_new_comment_on_post(user, comment)
    @user = user
    @comment = comment
    @post = comment.post

    mail(to: @user.email, subject: I18n.t('mailer.post_user_mailer.subject'))
  end
end
