class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
      create_table :addresses do |t|
      t.string :f_name, null: false
      t.string :l_name, null: false
      t.string :f_name_kana, null: false
      t.string :l_name_kana, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :building_number, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false
      t.references :user_deal, null: false, foreign_key: true
      t.timestamps
    end
  end
end
