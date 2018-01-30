class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article, counter_cache, :comment_counts
  has_many :likes, dependent: :destroy
end
