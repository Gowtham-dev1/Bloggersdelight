class CategoryTable < ActiveRecord::Migration[6.1]
  def change
    create_table :categorysections do |t|
      t.string :category

      t.timestamps
    end
    add_column :articlesections, :categorysection_id, :integer
  end
end
