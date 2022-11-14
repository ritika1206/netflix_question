class User < ApplicationRecord
  has_many :user_subscriptions, dependent: :destroy, counter_cache: :subscriptions_count
  has_many :subscriptions, through: :user_subscriptions, source: :subscription
  has_one :active_subscription, -> { active }, through: :user_subscriptions, source: :subscription

  validates :name, :email, presence: true
  validates :name, format: { with: Netflix::REGEX_NAME }, allow_blank: true
  validates :active_subscriptions_count, numericality: { is: 1 }

  private

    def active_subscriptions_count
      subsciptions.where(status: 'active').count
    end
end

# name, email, subscriptions_count
