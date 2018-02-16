class Article < ApplicationRecord
  require 'date'

  has_many :comments, dependent: :destroy
  belongs_to :user

  # タグ付け
  acts_as_taggable

  # 検索機能
  def self.search(key)
    if key
      Article.where(['title LIKE ?', "%#{key}%"])
    else
      Article.all
    end
  end

  # 時間表示
  def before_time
    article_time = self.created_at.in_time_zone('Tokyo')
    now_time = DateTime.now
    difference = now_time.to_i - article_time.to_i + (9 * 60 * 60)
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
    else
      return "#{seconds}秒前"
    end
  end
end
