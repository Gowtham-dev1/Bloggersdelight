class ColChange < ActiveRecord::Migration[6.1]
  def change
    change_column :likesections, :likeduser_id, 'integer USING CAST(likeduser_id AS integer)'
  end
end
