class CreateCoachFunctions < ActiveRecord::Migration[5.0]
  def change
    create_table :coach_functions do |t|
      t.references :team, foreign_key: true, index: true
      t.string :coach_role

      t.timestamps
    end
  end
end
