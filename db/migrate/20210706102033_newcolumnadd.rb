class Newcolumnadd < ActiveRecord::Migration[6.1]
  def change
    add_column :articlesections, :categorysection_id, :integer
  end
end
