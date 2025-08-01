class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :age
      t.boolean :gender
      t.string :skill
      t.text :introduce
      t.datetime :create_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
