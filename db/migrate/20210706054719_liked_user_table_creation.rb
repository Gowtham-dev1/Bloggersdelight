class LikedUserTableCreation < ActiveRecord::Migration[6.1]
  def change
    create_table :likedusers do |t|
      t.integer :likesection_id
      t.integer :userauthentication_id

      t.timestamps
  end
end
