class Comment < ApplicationRecord
  require 'date'

  belongs_to :user
  belongs_to :article, counter_cache: :comment_counts
  has_many :likes, dependent: :destroy

  def before_time
    comment_time = self.created_at.in_time_zone('Tokyo')
    now_time = DateTime.now
    difference = now_time.to_i - comment_time.to_i
    seconds = difference
    minutes = difference / 60
    hours = difference / 60 /60
    days = difference / 60 /60 /24
    if days != 0
      return comment_time.strftime("%Y年%m月%d日")
    elsif hours != 0
      return "#{hours}時間前"
    elsif minutes != 0
      return "#{minutes}分前"
    elsif seconds != 0
      return "#{seconds}秒前"
    else
      return "たった今"
    end
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
