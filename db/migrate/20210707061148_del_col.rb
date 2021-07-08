class DelCol < ActiveRecord::Migration[6.1]
  def change
    remove_column :likesections, :likeduser_id
  end
end
