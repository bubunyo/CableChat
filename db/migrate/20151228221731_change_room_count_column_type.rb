class ChangeRoomCountColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :rooms, :count, :integer
  end
end
