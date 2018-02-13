class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar_image, AvatarImageUploader

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true

  def user_profile
    if company.present? && position.present?
      return "#{company.truncate(15)}\n#{position.truncate(15)}"
    elsif company.present?
      company.truncate(15)
    elsif position.present?
      position.truncate(15)
    end
  end

end

