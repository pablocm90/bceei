class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.string :diplome
      t.boolean :pack_deal
      t.references :coach_function, foreign_key: true, index: true
      t.timestamps
    end
  end
end
