class UserSubscription < ApplicationRecord
  belongs_to :user, counter_cache: :subscriptions_count
  belongs_to :subscription, counter_cache: :users_count
end

# user_id, subsciption_id
