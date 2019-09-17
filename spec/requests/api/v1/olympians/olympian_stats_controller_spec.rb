require "rails_helper"

describe "olympian_stats API" do
  before :each do
    @olympian1 = Olympian.create(name: "John", team: "USA", age: 24, sex: "M", height: 170, weight: 180)
    @olympian2 = Olympian.create(name: "Paul", team: "Canada", age: 36, sex: "M", height: 180, weight: 187)
    @olympian3 = Olympian.create(name: "Sally", team: "Mexico", age: 19, sex: "F", height: 150, weight: 125)
    @sport1 = Sport.create(name: "Gymnastics")
    @sport2 = Sport.create(name: "Weights")
    @game1 = Game.create(name: "2016 Winter Games")
    @event1 = Event.create(name: "Gymnastics Men's Individual All-Around", sport_id: @sport1.id)
    @event2 = Event.create(name: "Gymnastics Men's Individual One-one", sport_id: @sport2.id)
    @oe1 = OlympianEvent.create(olympian_id: @olympian1.id, event_id: @event1.id, medal: "Silver")
    @oe2 = OlympianEvent.create(olympian_id: @olympian2.id, event_id: @event1.id, medal: "Bronze")
    @oe3 = OlympianEvent.create(olympian_id: @olympian3.id, event_id: @event1.id, medal: "Gold")
    @oe4 = OlympianEvent.create(olympian_id: @olympian3.id, event_id: @event2.id, medal: "NA")
    @gs1 = GameSport.create(olympian_id: @olympian1.id, sport_id: @sport1.id, game_id: @game1.id)
    @gs2 = GameSport.create(game_id: @game1.id, sport_id: @sport1.id, olympian_id: @olympian2.id)
    @gs3 = GameSport.create(game_id: @game1.id, sport_id: @sport1.id, olympian_id: @olympian3.id)
    @gs4 = GameSport.create(game_id: @game1.id, sport_id: @sport2.id, olympian_id: @olympian3.id)
  end

  it "sends a list of olympians" do

    get '/api/v1/olympian_stats'

    expect(response).to be_successful

    olympian_stats = JSON.parse(response.body)

    attributes = ["total_competing_olympians", "average_weight", "average_age"]
    expected = {
                "female_olympians" => 125.0,
                "male_olympians" => 183.5,
                "unit" => "kg",
              }
    weight_keys = ["unit", "male_olympians", "female_olympians"]

    expect(olympian_stats["olympian_stats"].keys).to eq(attributes)
    expect(olympian_stats["olympian_stats"]["total_competing_olympians"]).to be_a(Integer)
    expect(olympian_stats["olympian_stats"]["average_weight"]).to be_a(Hash)
    expect(olympian_stats["olympian_stats"]["average_weight"].keys).to eq(weight_keys)
    expect(olympian_stats["olympian_stats"]["average_weight"]["male_olympians"]).to be_a(Float)
    expect(olympian_stats["olympian_stats"]["average_age"]).to be_a(Float)
    expect(olympian_stats["olympian_stats"]["total_competing_olympians"]).to equal(3)
    expect(olympian_stats["olympian_stats"]["average_weight"]).to eq(expected)
    expect(olympian_stats["olympian_stats"]["average_age"]).to equal(26.3)
  end
end
