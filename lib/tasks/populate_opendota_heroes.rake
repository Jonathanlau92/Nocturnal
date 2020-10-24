namespace :populate_opendota_heroes_to_database do 
  desc "This task populates all the heroes from opendota API"
  task :populate => :environment do
    responses = HTTParty.get('http://api.opendota.com/api/heroes')
    parsed_response = JSON.parse(responses.body)
    parsed_response.each do |r|
      Hero.create(name: r['localized_name'], hero_identifier: r['id'])
    end
  end
end
