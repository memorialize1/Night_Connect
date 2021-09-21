class CreateRelationRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :relation_rooms do |t|
      
      
      t.integer   :room_id
      
      t.references :user, foreign_key: true 
      #外部キー取得のコマンド。異なるモデルのテーブルの情報を識別する。これでusersのテーブルと紐づけ
      t.references :participant, foreign_key: { to_table: :users } 

      t.timestamps
    end
  end
end
