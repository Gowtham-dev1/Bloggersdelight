class Favorite < ApplicationRecord
  belongs_to :userauthentication
  belongs_to :articlesection
end
