class CreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do |t|
      t.references :player, foreign_key: true
      t.references :user, foreign_key: true
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
