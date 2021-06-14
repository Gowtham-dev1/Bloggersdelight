class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :topic
      t.string :content
      t.integer :likes_count

      t.timestamps
    end
  end
end
