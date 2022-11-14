namespace :subscription do
  desc 'Updating user\'s subscription\'s status'
  task :update_status => [:environment] do
    Subscription.all.each do |subscription|
      subscription.update(status: 'inactive') if subscription.expiration_date < Date.today
    end
  end
end
