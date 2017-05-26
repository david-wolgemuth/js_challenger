class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :function_name
      t.text :description
      t.text :parameters
      t.text :tests

      t.timestamps
    end
  end
end
