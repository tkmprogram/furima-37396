class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :category_id, null: false
      t.integer :situation_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :send_day_id, null: false
      t.integer :price, null: false
      t.string :title, null: false
      t.text :explanation, null: false
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
