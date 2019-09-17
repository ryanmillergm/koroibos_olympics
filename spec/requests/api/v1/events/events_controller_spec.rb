require "rails_helper"

describe "events API" do
  before :each do
    @sport1 = Sport.create(name: "Gymnastics")
    @sport2 = Sport.create(name: "Weights")
    @sport3 = Sport.create(name: "Rowing")
    @event1 = Event.create(name: "Gymnastics Men's Individual All-Around", sport_id: @sport1.id)
    @event2 = Event.create(name: "Gymnastics Men's Individual One-one", sport_id: @sport1.id)
    @event3 = Event.create(name: "Rowing Men's Coxless Pairs", sport_id: @sport1.id)
    @event4 = Event.create(name: "Handball Men's Handball", sport_id: @sport2.id)
    @event5 = Event.create(name: "Boxing Men's Middleweight", sport_id: @sport2.id)
    @event6 = Event.create(name: "Athletics Men's 400 metres", sport_id: @sport2.id)
    @event7 = Event.create(name: "Equestrianism Mixed Three-Day Event, Individual", sport_id: @sport2.id)
    @event8 = Event.create(name: "Cycling Women's Road Race, Individual", sport_id: @sport3.id)
  end

  it "sends a list of olympians" do

    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body)

    binding.pry
    # attributes = ["total_competing_olympians", "average_weight", "average_age"]
    # expected = {
    #             "female_olympians" => 125.0,
    #             "male_olympians" => 183.5,
    #             "unit" => "kg",
    #           }
    # weight_keys = ["unit", "male_olympians", "female_olympians"]

    expect(events["olympian_stats"].keys).to eq(attributes)
    # expect(olympian_stats["olympian_stats"]["total_competing_olympians"]).to be_a(Integer)
    # expect(olympian_stats["olympian_stats"]["average_weight"]).to be_a(Hash)
    # expect(olympian_stats["olympian_stats"]["average_weight"].keys).to eq(weight_keys)
    # expect(olympian_stats["olympian_stats"]["average_weight"]["male_olympians"]).to be_a(Float)
    # expect(olympian_stats["olympian_stats"]["average_age"]).to be_a(Float)
    # expect(olympian_stats["olympian_stats"]["total_competing_olympians"]).to equal(3)
    # expect(olympian_stats["olympian_stats"]["average_weight"]).to eq(expected)
    # expect(olympian_stats["olympian_stats"]["average_age"]).to equal(26.3)
    # Event.where(sport_id: 3)
  end
end
