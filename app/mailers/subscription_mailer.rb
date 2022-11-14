class SubscriptionMailer < ApplicationMailer
  def alert_expiration(subscription, expiring_in, user)
    @subscription = subsciption
    @expiring_in = expiring_in
    @user = user
    mail to: user_email, subject: 'Subscription expiration alert'
  end
end
