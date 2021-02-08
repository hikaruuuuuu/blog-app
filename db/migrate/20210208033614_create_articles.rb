class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title,         null: false
      t.text :text,            null: false
      t.boolean :buy_setting,  null: false
      t.integer :price
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end
