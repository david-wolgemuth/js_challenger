class CreateChallengeTests < ActiveRecord::Migration[5.1]
  def change
    create_table :challenge_tests do |t|
      t.text :inputs
      t.string :return_value
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
