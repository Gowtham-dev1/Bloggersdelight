class Commentsection < ApplicationRecord
  belongs_to :articlesection

  validates :comment, presence: true, length: { maximum: 50 }
end
