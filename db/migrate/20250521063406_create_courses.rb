class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :s_code, null: false
      t.timestamps
    end
    add_index :courses, :s_code
    add_foreign_key :courses, :subjects, column: :s_code, primary_key: :c_code
  end
end
