class CreateArticlesections < ActiveRecord::Migration[6.1]
  def change
    create_table :articlesections do |t|
      t.integer :user_id
      t.string :article_topic
      t.string :article_content
      t.integer :likes_count

      t.timestamps
    end
  end
end
