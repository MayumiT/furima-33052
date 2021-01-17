class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.string :text,           null: false
      t.string :category_id,    null: false
      t.string :condition_id,   null: false
      t.string :prefecture_id,  null: false
      t.string :area_id,        null: false
      t.string :day_id,         null: false
      t.string :price,          null: false
      t.references :user,       foreign_key: true

      t.timestamps
    end
  end
end
