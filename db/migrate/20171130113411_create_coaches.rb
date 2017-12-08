class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.string :diplome
      t.boolean :pack_deal
      t.timestamps
    end
  end
end
