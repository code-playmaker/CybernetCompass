class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title,             null: false
      t.text :content,             null: false
      t.integer :importancy,       null: false
      t.integer :emergency,        null: false
      t.string :upload_file_name
      t.binary :upload_file
      t.timestamps
    end
  end
end
