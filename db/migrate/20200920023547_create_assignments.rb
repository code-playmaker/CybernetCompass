class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :department,   null: false
      t.string :division,     null: false
      t.string :charge,       null: false
      t.integer :user_id,     null: false
      t.references :users,     foreign_key: true, index: true
      t.timestamps
    end
  end
end
