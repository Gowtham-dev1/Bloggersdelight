class Userauthentication < ApplicationRecord
  has_many :articlesections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
