class User < ApplicationRecord
  has_many :subsciption_ids, class_name: 'UserSubscription', dependent: :destroy, counter_cache: :subscriptions_count, foreign_key: :user_id, inverse_of: :user 
  has_many :subsciptions, through: :subsciption_ids, source: :subscription

  validates :name, :email, presence: true
  validates :name, format: { with: Netflix::REGEX_NAME }, allow_blank: true
  validates :active_subscriptions_count, numericality: { is: 1 }

  private

    def active_subscriptions_count
      subsciptions.where(status: 'active').count
    end
end

# name, email, subscriptions_count
