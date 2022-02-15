class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :cends do |t|
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, null: false
      t.string :address, null: false
      t.string :building
      t.string :tel, null: false
      t.references :order, null: false
      t.timestamps
    end
  end
end
