class Changecal < ActiveRecord::Migration[6.1]
  def change
    change_column :articlesections, :categorysection_id,:string
    rename_column :articlesections, :categorysection_id , :category
  end
end
