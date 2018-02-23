class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar_image, AvatarImageUploader

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  acts_as_followable # フォロワー機能
  acts_as_follower   # フォロー機能
  has_many :questions, dependent: :destroy
  belongs_to :answer, dependent: :destroy

  validates :name, presence: true

  # 検索機能
  def self.search(key)
    if key
      User.where(['name LIKE ?', "%#{key}%"])
    else
      User.all
    end
  end

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
