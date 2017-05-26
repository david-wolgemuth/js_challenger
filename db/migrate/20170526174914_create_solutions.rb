class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.text :code
      t.boolean :passing
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
