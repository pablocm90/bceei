class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.date :before
      t.date :after
      t.string :name
      t.references :coach_function, foreign_key: true, index: true

      t.timestamps
    end
  end
end

