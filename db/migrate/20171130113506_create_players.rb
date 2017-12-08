class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :short_size
      t.string :shirt_size
      t.boolean :short, default: false
      t.boolean :shirt, default: false
      t.boolean :coti_paid, default: false
      t.references :menage, foreign_key: true, index: true
      t.references :team, foreign_key: true, index: true

      t.timestamps
    end
  end
end
