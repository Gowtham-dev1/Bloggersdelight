class ReplyTableCreation < ActiveRecord::Migration[6.1]
  def change
    create_table :replysections do |t|
      t.integer :userauthentication_id
      t.integer :commentsection_id
      t.string :reply

      t.timestamps
    end
  end
end
