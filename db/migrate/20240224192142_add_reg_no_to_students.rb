class AddRegNoToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :reg_no, :string
  end
end
