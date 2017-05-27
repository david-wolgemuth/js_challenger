class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :function_name
      t.text :description
      t.text :parameters
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
