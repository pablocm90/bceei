class CreateFields < ActiveRecord::Migration[5.0]
  def change
    create_table :fields do |t|
      t.boolean :digital
      t.boolean :usable

      t.timestamps
    end
  end
end
