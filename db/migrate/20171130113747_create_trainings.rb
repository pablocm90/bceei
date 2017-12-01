class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.references :team, foreign_key: true
      t.references :field, foreign_key: true
      t.string :day
      t.time :time

      t.timestamps
    end
  end
end
