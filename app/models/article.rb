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

  def fetch_top_comment
    self.comments.includes(:user).order("like_counts DESC").first
  end
end
