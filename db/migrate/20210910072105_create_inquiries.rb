class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      
      #ユーザーから管理者へのお問い合わせメール
      
      t.string  :title
      t.text    :inquiry
      t.integer :user_id
      t.integer :add_id
      t.boolean :reading,         default: true, null: false
      t.integer :mail_status,     default: 0, null: false

      t.timestamps
    end
  end
end
