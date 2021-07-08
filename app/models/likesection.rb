class Likesection < ApplicationRecord
  belongs_to :articlesection
  has_many :likedusers
end
