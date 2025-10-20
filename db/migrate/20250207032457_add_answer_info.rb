class AddAnswerInfo < ActiveRecord::Migration[8.0]
  def add
    add_column :answers, :student_number, :string
    add_column :answers, :department, :string
    add_column :answers, :course, :string
    add_column :answers, :grade, :string
  end
end
