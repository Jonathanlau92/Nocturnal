module Adapter
  class OpenDota
    include HTTParty
    def initialize(player)
      @player = player
    end

    def get_hero_stat(hero_name)
      if @player.steam_id.present?
        matched_id = nil
        # Loop opendota heroes and match the hero's name with the hero the user chose in user SHOW page. Then, store the ID in arr
        Hero.all.each do |hero|
          matched_id = hero.hero_identifier if hero.name == hero_name
        end
        # Call API to get back all the heroes stats
        @heroes_stat = HTTParty.get('http://api.opendota.com/api/players/' + @player.steam_id + '/heroes')
        JSON.parse(@heroes_stat.body).each do |hero|
          # match the hero with the matched id to get the stats
          matched_hero = hero if hero['hero_id'] == matched_id
        end
        return matched_hero
      end
    end
  end
end
