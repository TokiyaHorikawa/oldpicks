class Like < ApplicationRecord
  belongs_to user
  belongs_to article, counter_cache: :like_counts
  belongs_to comment, counter_cache: :like_counts
end
