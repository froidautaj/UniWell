# frozen_string_literal: true

class AvatarValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    record.errors.add(attribute, 'Must be a JPEG or PNG file') unless value.content_type.in?(%w[image/jpeg image/png])

    # max size 10mb
    record.errors.add(attribute, 'File too big, max size is 10MB') if value.byte_size > 10.megabytes
  end
end
