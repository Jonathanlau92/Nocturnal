namespace :scheduler do
  desc "This task is called by the Heroku scheduler add-on"
  task :team_confirmation => :environment do
    League.all.each do |l|
      if (l.date.to_date - Date.current).to_i == 14
        l.teams.each do |t|
          t.users.each do |u|
            UserMailer.team_details(l, t, u).deliver_now
          end
        end
      end
    end
  end

  task :check_in_details => :environment do
    League.all.each do |l|
      if (l.date.to_date - Date.current).to_i == 3
        l.teams.each do |t|
          t.users.each do |u|
            UserMailer.check_in(l, t, u).deliver_now
          end
        end
      end
    end
  end

  task :actual_day => :environment do
    League.all.each do |l|
      if l.date.to_date == Date.current
        l.teams.each do |t|
          t.users.each do |u|
            UserMailer.actual_day(l, u).deliver_now
          end
        end
      end
    end
  end
end
