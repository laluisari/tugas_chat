class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :nama
      t.string :deskripsi
      t.integer :tipe

      t.timestamps
    end
  end
end
