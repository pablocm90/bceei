class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.references :user, foreign_key: true
      t.references :coaching_staff, foreign_key: true
      t.boolean :assistant
      t.string :diplome
      t.boolean :pack_deal

      t.timestamps
    end
  end
end
