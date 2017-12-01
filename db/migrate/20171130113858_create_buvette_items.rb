class CreateBuvetteItems < ActiveRecord::Migration[5.0]
  def change
    create_table :buvette_items do |t|
      t.string :name
      t.integer :quantity
      t.boolean :order_more

      t.timestamps
    end
  end
end
