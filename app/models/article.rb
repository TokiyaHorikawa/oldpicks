class Article < ApplicationRecord
  require 'date'

  has_many :comments
  belongs_to :user

  def before_time
    article_time = self.created_at
    now_time = DateTime.now
    difference = now_time.to_i - article_time.to_i
    seconds = difference
    minutes = difference / 60
    hours = difference / 60 /60
    days = difference / 60 /60 /24
    if days != 0
      return article_time.strftime("%Y年%m月%d日")
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
end
