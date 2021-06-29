class Userauthentication < ApplicationRecord
  has_many :articlesections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

 has_many :access_tokens,
         class_name: 'Doorkeeper::AccessToken',
         foreign_key: :resource_owner_id,
         dependent: :delete_all # or :destroy if you need callbacks

   def self.authenticate(email, password)
      user = Userauthentication.find_for_authentication(email: email)
      user&.valid_password?(password) ? user : nil
   end
end
