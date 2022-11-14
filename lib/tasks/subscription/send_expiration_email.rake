namespace :subscription do
  desc 'Sending email to user if their subscription is expiring in a month, a week or a day after'
  task :send_expiration_email => [:environment] do
    subscriptions = Subscription.includes(:user)
    subscription.each do |subscription|
      case subscription.expiration_date - Date.today
      when 1.month
        expiring_in = 1.month
      when 1.week
        expiring_in = 1.week
      when 1.day
        expiring_in = 1.day
      end
      subsciption.users.each do |user|
        SubscriptionMailer.alert_expiration(subscription, expiring_in, user)
      end
    end
  end
end
