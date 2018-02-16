class Like < ApplicationRecord
  belongs_to :comment, counter_cache: :like_counts
  belongs_to :user
end
