class CreateExamHalls < ActiveRecord::Migration[7.1]
  def change
    create_table :exam_halls do |t|
      t.string :no, null: false
      t.index :no, unique: true

      t.timestamps
    end
  end
end
