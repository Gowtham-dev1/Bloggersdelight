class NewTable < ActiveRecord::Migration[6.1]
  def change
    create_table :activitysections do |t|
      t.integer :userauthentication_id
      t.string :activity

      t.timestamps
    end
  end
end
