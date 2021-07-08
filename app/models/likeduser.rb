class Likeduser < ApplicationRecord
  belongs_to :likesection
  belongs_to :userauthentication
end
