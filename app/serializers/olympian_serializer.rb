class OlympianSerializer < ActiveModel::Serializer
  attributes :name,
             :team,
             :age,
             :sport,
             :total_medals_won

end
