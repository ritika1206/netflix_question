namespace :subscription do
  desc 'Updating user\'s subscription\'s status'
  task :update_status => [:environment] do
    Subscription.all.each do |subscription|
      subscription.update(status: 'inactive') if subscription.created_at + subscription.validity < Date.today
    end
  end
end
