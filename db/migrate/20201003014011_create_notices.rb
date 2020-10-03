class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string :ntc_title,             null: false
      t.text :ntc_content,             null: false
      t.integer :ntc_importancy,       null: false
      t.integer :ntc_emergency,        null: false
      t.string :ntc_upload_file_name
      t.binary :ntc_upload_file
      t.references :user,     foreign_key: true, index: true
      t.timestamps
    end
  end
end
