class Categorysection < ApplicationRecord
  has_many :articlesections, dependent: :destroy
end
