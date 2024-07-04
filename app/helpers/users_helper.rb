# frozen_string_literal: true

module UsersHelper
  def user_badge(user)
    return unless user.badge.positive?

    "<span class='pe-2 d-inline-flex align-items-center' title='Gold badge'><i class='las la-medal text-primary' style='font-size: 18px;'></i>#{ user.badge }</span>".html_safe
  end

  def user_total_comments(user)
    user.comments.count
  end

  def user_total_posts(user)
    user.posts.count
  end
end
