class CreateCreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :create_rooms do |t|
      t.string :topic

      t.timestamps
    end
  end
end
