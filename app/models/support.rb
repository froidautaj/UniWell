class Support < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, format: { with: /\A\+?\d{10,14}\z/ }
  validates :message, presence: true
end
