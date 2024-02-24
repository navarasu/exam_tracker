class ChangeColumsToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.remove :email
      t.string :name, null: false
      t.integer :role, limit: 1, default: 0
    end
  end
end
