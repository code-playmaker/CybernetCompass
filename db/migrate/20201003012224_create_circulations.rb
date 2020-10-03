class CreateCirculations < ActiveRecord::Migration[5.2]
  def change
    create_table :circulations do |t|
      t.string :cir_title,             null: false
      t.text :cir_content,             null: false
      t.integer :cir_importancy,       null: false
      t.integer :cir_emergency,        null: false
      t.string :cir_upload_file_name
      t.binary :cir_upload_file
      t.references :user,     foreign_key: true, index: true
      t.timestamps
    end
  end
end
