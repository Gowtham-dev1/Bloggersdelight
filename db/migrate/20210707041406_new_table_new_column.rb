class NewTableNewColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :activitysections, :articlesection_id, :integer
  end
end
