class Userauthentication < ApplicationRecord
  has_many :articlesections
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
