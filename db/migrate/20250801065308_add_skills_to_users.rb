class AddSkillsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :skills, :string
  end
end
