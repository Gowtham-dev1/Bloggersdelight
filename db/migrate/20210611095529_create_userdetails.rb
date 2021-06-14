class CreateUserdetails < ActiveRecord::Migration[6.1]
  def change
    create_table :userdetails do |t|
      t.string :user_name
      t.string :password
      t.string :mail

    end
  end
end
