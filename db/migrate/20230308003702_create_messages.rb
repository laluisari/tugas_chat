class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|

      t.string :chat
      t.integer :user_id
      t.integer :room_id
      # t.references :user, null: false, foreign_key: true
      # t.references :room, null: false, foreign_key:true

      t.timestamps

    end
  end
end
