class Articlesection < ApplicationRecord
  validates :article_topic, presence: true, length: { maximum: 40 }
  validates :article_content, presence: true, length: { maximum: 450 }
  before_save :not_saved
  after_save :saved


  belongs_to :userauthentication
  has_many :commentsections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :likesection, dependent: :destroy


  private
    def saved
      puts "

      Article saved!

      "
    end

    def not_saved
      puts "

      Article yet to get saved!

      "
    end

end
