class CreateUserDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :user_deals do |t|

      t.timestamps
    end
  end
end
