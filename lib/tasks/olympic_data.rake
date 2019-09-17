require 'csv'

namespace :import do
  desc "Import data from CSV files"
    task olympians: :environment do
      `rails db:{drop,create,migrate}`

      options = {
        header_converters: :symbol,
        headers: true
      }

      CSV.foreach('./db/olympic_data_2016.csv', options) do |row|
        olympian = Olympian.find_or_create_by(name: row[:name]) do |each_olympian|
          each_olympian.team = row[:team]
          each_olympian.age = row[:age]
          each_olympian.sex = row[:sex]
          each_olympian.height = row[:height]
          each_olympian.weight = row[:weight]
        end

        game = Game.find_or_create_by(name: row[:games])

        sport = Sport.find_or_create_by(name: row[:sport])

        event = Event.find_or_create_by(name: row[:event], sport_id: sport.id)

        OlympianGame.create(olympian_id: olympian.id, game_id: game.id)
        GameSport.create(game_id: game.id, sport_id: sport.id)
        OlympianEvent.create(olympian_id: olympian.id, event_id: event.id, medal: row[:medal])
      end
      p "You have added all your data"
    end
end
