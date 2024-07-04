module NotificationsHelper
  def notifications_list
    return '' unless user_signed_in?

    notifications = current_user.notifications.order(created_at: :desc).limit(5)
    notifications_view = ''
    notifications.each do |notification|
      notifications_view += link_to mark_as_read_notification_path(notification), class: "dropdown-item" do
        content_tag(:div, class: "media media-card media--card shadow-none mb-0 rounded-0 align-items-center bg-transparent") do
          content_tag(:div, class: "media-img media-img-sm flex-shrink-0") do
            image_tag notification.user.avatar, alt: 'avatar'
          end +
            content_tag(:div, class: "media-body p-0 border-left-0") do
              content_tag(:h5, notification.title, class: "fs-14 fw-regular") +
                content_tag(:small, class: "meta d-block lh-24") do
                  content_tag(:span, notification.created_at.strftime("%b %d, %Y"))
                end
            end
        end
      end
    end
    notifications_view.html_safe
  end
end
