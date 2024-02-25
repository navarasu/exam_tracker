class CreateSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.string :code

      t.timestamps
    end
  end
end
