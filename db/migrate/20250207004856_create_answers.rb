class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.string :student_number
      t.string :department
      t.string :course
      t.string :grade
      t.timestamps
    end
  end
end
