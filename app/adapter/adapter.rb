module Adapter
  class OpenDota
    include HTTParty
    def initialize(player)
      @player = player
    end

    def get_hero_stat(hero_name)
      if @player.steam_id.present?
        matched_id = nil
        # Find the Hero in HERO table where the name is equal to the name of the image that is being passed in.
        matched_id = Hero.where(name: hero_name).last.hero_identifier
        # Call API to get back all the heroes stats
        @heroes_stat = HTTParty.get('http://api.opendota.com/api/players/' + @player.steam_id + '/heroes')
        JSON.parse(@heroes_stat.body).each do |hero|
          # match the hero with the matched id to get the stats
          @matched_hero = hero if hero['hero_id'].to_i == matched_id
        end
        return @matched_hero
      else
        return nil
      end
    end
  end
end
