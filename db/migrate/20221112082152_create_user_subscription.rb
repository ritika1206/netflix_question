class CreateUserSubscription < ActiveRecord::Migration[7.0]
  def change
    create_table :user_subscriptions do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :subscription, null: false, foreign_key: { to_table: :subsciptions }

      t.timestamps
    end
  end
end
