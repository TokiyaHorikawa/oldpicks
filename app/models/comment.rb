class Comment < ApplicationRecord
  belongs_to :article
  has_many :likes, dependent: :destroy
end
