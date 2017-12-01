class CreateShopItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_items do |t|
      t.string :name
      t.string :size
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
