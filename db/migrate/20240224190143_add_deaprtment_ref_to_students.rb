class AddDeaprtmentRefToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :department, null: false, foreign_key: true
  end
end
