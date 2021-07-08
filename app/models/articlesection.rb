class Articlesection < ApplicationRecord
  validates :article_topic, presence: true, length: { maximum: 40 }
  validates :article_content, presence: true, length: { maximum: 450 }
  # before_save :not_saved
  # after_save :saved


  belongs_to :userauthentication
  belongs_to :categorysection
  has_many :commentsections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :likesection, dependent: :destroy
  has_many :activitysections, dependent: :destroy

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do|article|
        csv << article.attributes.values_at(*column_names)
      end
    end
  end

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
