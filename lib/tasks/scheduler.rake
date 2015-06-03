namespace :scheduler do

  desc "Increments the current day of challenge"
  task increment_day: :environment do
    last_challenge = Challenge.last
    last_challenge.current_day += 1
    last_challenge.save

  end

end
