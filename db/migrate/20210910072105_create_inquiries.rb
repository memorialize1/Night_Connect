class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      
      #ユーザーから管理者へのお問い合わせメール
      
      t.string  :title
      t.text    :inquiry
      t.integer :user_id
      t.boolean :mail_status,        default: true, null: false

      t.timestamps
    end
  end
end
