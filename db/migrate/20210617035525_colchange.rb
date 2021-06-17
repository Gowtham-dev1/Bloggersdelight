class Colchange < ActiveRecord::Migration[6.1]
  def change
    rename_column :commentsections, :user_id, :userauthentication_id
    rename_column :commentsections, :article_id, :articlesection_id
    rename_column :likesections, :article_id, :articlesection_id
  end
end
