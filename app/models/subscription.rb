class Subscription < ApplicationRecord
  MAXIMUN_USER_COUNT = 4
  has_many :user_subscriptions, dependent: :destroy, counter_cache: :users_count
  has_many :users, through: :subscribed_users

  validates :name, :price, :validity, presence: true
  validates :users_count, numericality: { less_than_or_equal_to: MAXIMUN_USER_COUNT }
  with_options allow_blank: true do
    validates :name, format: { with: Netflix::REGEX_NAME }
    validates :price, :validity, :users_count, numericality: { only_integer: true, greater_than: 0 }
  end

  enum status: [:active, :inactive]

  def expiration_date
    self.created_at + validity.days
  end
end

# name, validity, price, status(enum), users_count
# validity will be number of days
