class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :parent, foreign_key: true
      t.references :team, foreign_key: true
      t.references :field, foreign_key: true
      t.datetime :date_and_time
      t.string :oposing_team
      t.boolean :home

      t.timestamps
    end
  end
end
