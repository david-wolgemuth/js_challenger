class CreateSolutionsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions_tags do |t|
      t.integer :title
      t.references :user, foreign_key: true
      t.references :solution, foreign_key: true

      t.timestamps
    end
  end
end
