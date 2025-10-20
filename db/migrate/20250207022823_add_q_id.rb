class AddQId < ActiveRecord::Migration[8.0]
  def up
    add_column :questions, :q_id, :integer
  end
end
