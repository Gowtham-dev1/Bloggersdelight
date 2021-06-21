class Userauthentication < ApplicationRecord
  has_many :articlesections
  has_many :favorites
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
