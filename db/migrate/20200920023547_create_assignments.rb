class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :department,   null: false
      t.string :division,     null: false
      t.string :charge,       null: false
      t.references :user,     foreign_key: true, null:false
      t.timestamps
    end
  end
end
