class Article < ApplicationRecord
  belongs_to :userdetail
  has_many :commentsection
  has_one :likesection
end
