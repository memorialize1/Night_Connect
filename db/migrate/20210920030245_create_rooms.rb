class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      
      t.text      :name
      t.integer   :relation_room_id
      t.integer   :user_id
      t.integer   :add_id

      t.timestamps
    end
  end
end
