# frozen_string_literal: true

class FileValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.attached?
    return if value.content_type.in?(%('text/plain image/jpeg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document'))

    record.errors.add(attribute, 'Must be a .pdf, .doc, .docx, JPEG, PNG file')
  end
end
