class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.text :body
      t.integer :user_id
      t.timestamps
    end

    add_index :goals, :user_id
  end
end
