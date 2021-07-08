class DelTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :replysections
  end
end
