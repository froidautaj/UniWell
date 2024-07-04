# frozen_string_literal: true

module PostsHelper # :nodoc:
  def last_active(post)
    "#{time_ago_in_words(@comments&.last&.created_at || post.created_at)} ago"
  end

  def total_questions
    number_to_human(Post.count)
  end

  def total_answers
    number_to_human Comment.count
  end

  def total_accepted_answers
    number_to_human Post.where.not(accepted_comment_id: nil).count
  end

  def total_users
    number_to_human User.count
  end

  def trending_tags
    @trending_tags ||= Post.from(Post.select('unnest(tags) as tag')).select('count(tag) total, tag').group('tag')
                           .order('total desc').limit(11)
  end

  def related_questions
    Post.order('RANDOM()').includes(:user).limit(3)
  end

  def file_preview(post)
    return unless post.file.attached?

    if post.file.representable?
      link_to rails_blob_path(post.file), target: '_blank' do
        image_tag post.file.representation(resize_to_limit: [100, 100])
      end
    else
      link_to 'Attachment', rails_blob_path(post.file, disposition: "attachment")
    end
  end
end
