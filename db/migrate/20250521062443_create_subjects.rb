class CreateSubjects < ActiveRecord::Migration[8.0]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.string :c_code, null: false
      t.timestamps
    end
    add_index :subjects, :c_code, unique: true
  end
end
