class CreateChallengesRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges_ratings do |t|
      t.integer :quality
      t.integer :difficulty
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
