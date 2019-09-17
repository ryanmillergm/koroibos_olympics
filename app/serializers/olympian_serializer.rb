class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :name,
             :team,
             :age,
             :sex,
             :height,
             :weight

end
