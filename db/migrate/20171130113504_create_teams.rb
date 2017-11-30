class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.references :player, foreign_key: true
      t.date :before
      t.date :after
      t.references :coaching_staff, foreign_key: true

      t.timestamps
    end
  end
end
