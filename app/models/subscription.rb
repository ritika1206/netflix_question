class Subscription < ApplicationRecord
  has_many :user_ids, class_name: 'UserSubscription', dependent: :destroy, counter_cache: :users_count, foreign_key: :subsciption_id, inverse_of: :subscription
  has_many :users, through: :user_ids, source: :user

  validates :name, :price, :validity, presence: true
  validates :users_count, numericality: { less_than_or_equal_to: 4 }
  with_options allow_blank: true do
    validates :name, format: { with: Netflix::REGEX_NAME }
    validates :price, :validity, :users_count, numericality: { only_integer: true, greater_than: 0 }
  end

  enum status: [:active, :inactive]
end

# name, validity, price, status(enum), users_count
# validity will be number of days
