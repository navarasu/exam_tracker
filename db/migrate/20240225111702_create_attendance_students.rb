class CreateAttendanceStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :attendance_students do |t|
      t.references :attendance, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
