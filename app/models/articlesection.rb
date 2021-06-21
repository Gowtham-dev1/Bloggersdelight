class Articlesection < ApplicationRecord
  validates :article_topic, presence: true, length: { maximum: 40 }
  validates :article_content, presence: true, length: { maximum: 350 }

  belongs_to :userauthentication
  has_many :commentsections
  has_many :favorites
  has_one :likesection

end
