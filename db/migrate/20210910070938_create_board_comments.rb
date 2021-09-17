class CreateBoardComments < ActiveRecord::Migration[5.2]
  def change
    create_table :board_comments do |t|
      
      t.text    :comment
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end
  end
end
