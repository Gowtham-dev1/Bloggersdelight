class Articlesection < ApplicationRecord
  validates :article_topic, presence: true, length: { maximum: 40 }
  validates :article_content, presence: true, length: { maximum: 350 }

  belongs_to :userauthentication
  has_many :commentsections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :likesection, dependent: :destroy

end
