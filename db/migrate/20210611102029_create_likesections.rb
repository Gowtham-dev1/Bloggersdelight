class CreateLikesections < ActiveRecord::Migration[6.1]
  def change
    create_table :likesections do |t|
      t.integer :article_id
      t.string :users_liked

      t.timestamps
    end
  end
end
