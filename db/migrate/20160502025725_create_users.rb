class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :first_name, presence: true
      t.string :last_name, presence: true
      t.integer :age, presence: true
      t.timestamps null: false
    end
  end
end