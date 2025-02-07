class AddAnswerContent < ActiveRecord::Migration[8.0]
  def up
    add_column :answers, :content, :string
  end
end
