class CreateSubscription < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :name, null: false
      t.integer :validity, null: false
      t.integer :users_count
      t.integer :price, null: false
      t.string :status, default: 'active'

      t.timestamps
    end
  end
end
