class Changeagain < ActiveRecord::Migration[6.1]
  def change
    rename_column :commentsections, :commment, :comment
  end
end
