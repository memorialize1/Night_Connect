class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      
      t.string  :title
      t.integer :genre_id
      t.integer :user_id
      t.integer :admin_id
      #Adminが作成した基本スレッドを上方に固定するためのタグ

      t.timestamps
    end
  end
end
