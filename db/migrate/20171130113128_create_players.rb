class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.references :user, foreign_key: true
      t.string :short_size
      t.string :shirt_size
      t.boolean :short, default: false
      t.boolean :shirt, default: false
      t.boolean :coti_paid, default: false
      t.references :menage, foreign_key: true

      t.timestamps
    end
  end
end
