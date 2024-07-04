# frozen_string_literal: true

class User < ApplicationRecord # :nodoc:

  TYPES = { student: Student.to_s, professor: Professor.to_s, university_tutor: UniversityTutor.to_s }.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_one_attached :avatar, dependent: :purge_later
  has_rich_text :description

  # validates :username, presence: true, uniqueness: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :type, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }
  validates :avatar, avatar: true

  after_create :attach_default_avatar

  def full_name
    "#{first_name} #{last_name}"
  end

  def attach_default_avatar
    avatar.attach(
      filename: 'avatar.png',
      content_type: 'image/png',
      io: File.open(
        Rails.root.join('app', 'assets', 'images', 'avatar.png')
      )
    )
  end

  def increment_badge
    increment!(:badge)
  end
end
