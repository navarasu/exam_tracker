class CreateExamSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :exam_schedules do |t|
      t.timestamp :date
      t.references :exam_hall, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
