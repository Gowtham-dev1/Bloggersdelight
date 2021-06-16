class Articlesection < ApplicationRecord
  validates :article_topic, presence: true
  validates :article_content, presence: true

  belongs_to :userauthentication
  has_many :commentsections
  has_one :likesection
end
