class Addforeignkey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :oauth_access_tokens, :userauthentications, column: :resource_owner_id
  end
end
