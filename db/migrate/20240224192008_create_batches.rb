class CreateBatches < ActiveRecord::Migration[7.1]
  def change
    create_table :batches do |t|
      t.string :name, null: false
      t.index :name, unique: true

      t.timestamps
    end
  end
end
