class OlympianSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :name,
             :team,
             :age,
             :sport,
             :total_medals_won

    Olympian

end
