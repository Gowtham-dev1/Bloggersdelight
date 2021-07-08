class Commentsection < ApplicationRecord
  belongs_to :articlesection
  has_one :userauthentication, through: :articlesection

  validates :comment, presence: true, length: { maximum: 50 }
end
