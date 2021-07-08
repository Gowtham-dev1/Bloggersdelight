class LikedUserTableCreation < ActiveRecord::Migration[6.1]
  def change
    create_table :likedusers do |t|
      t.integer :likesection_id
      t.integer :userauthentication_id

      t.timestamps
    end
    rename_column :likesections, :users_liked, :likeduser_id
  end
end
