class Userauthentication < ApplicationRecord
  has_many :articlesections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likedusers, dependent: :destroy
  has_many :activitysections, dependent: :destroy
  has_many :commentsections, through: :articlesections
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all
  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

   def self.authenticate(email, password)
      user = Userauthentication.find_for_authentication(email: email)
      user&.valid_password?(password) ? user : nil
   end

   def active_for_authentication?
     !self.user_banned
   end

   def inactive_message
	   "Your account is banned"
   end
end
