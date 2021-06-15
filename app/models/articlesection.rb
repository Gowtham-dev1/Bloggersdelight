class Articlesection < ApplicationRecord
  has_many :commentsections
  has_one :likesections
end
