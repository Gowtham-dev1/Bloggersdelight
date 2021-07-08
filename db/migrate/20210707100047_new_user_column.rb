class NewUserColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :userauthentications, :user_banned, :boolean
  end
end
