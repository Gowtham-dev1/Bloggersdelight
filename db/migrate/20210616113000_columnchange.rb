class Columnchange < ActiveRecord::Migration[6.1]
  def change
    rename_column :articlesections, :user_id, :userauthentication_id
  end
end
