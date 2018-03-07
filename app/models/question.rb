class Question < ApplicationRecord
  belongs_to :user
  has_one :answer

  # 日付の表示
  def date
    question_time = self.created_at
    return question_time.strftime("%-m/%-d")
  end
end
