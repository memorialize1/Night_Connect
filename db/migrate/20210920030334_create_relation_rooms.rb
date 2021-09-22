class CreateRelationRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :relation_rooms do |t|
      
      
      t.integer :room_id
      # t.references :my_room,        foreign_key: { to_table: :room } 
      
      t.integer :participant_id,    foreign_key: { to_table: :users } 

      t.timestamps
    end
  end
end
