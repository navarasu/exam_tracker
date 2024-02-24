class AddBatchRefToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :batch, null: false, foreign_key: true
  end
end
