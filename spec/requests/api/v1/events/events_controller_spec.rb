require "rails_helper"

describe "events API" do
  before :each do
    @olympian1 = Olympian.create(name: "John", team: "USA", age: 24, sex: "M", height: 170, weight: 180)
    @olympian2 = Olympian.create(name: "Paul", team: "Canada", age: 36, sex: "M", height: 180, weight: 187)
    @olympian3 = Olympian.create(name: "Sally", team: "Mexico", age: 19, sex: "F", height: 150, weight: 125)
    @olympian4 = Olympian.create(name: "Lisa", team: "Austrilia", age: 16, sex: "F", height: 125, weight: 110)
    @olympian5 = Olympian.create(name: "Alex", team: "South Korea", age: 20, sex: "M", height: 174, weight: 165)
    @olympian6 = Olympian.create(name: "Heather", team: "China", age: 22, sex: "F", height: 130, weight: 105)
    @olympian7 = Olympian.create(name: "Bob", team: "Russia", age: 29, sex: "M", height: 165, weight: 160)
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
    @oe1 = OlympianEvent.create(olympian_id: @olympian1.id, event_id: @event1.id, medal: "Silver")
    @oe2 = OlympianEvent.create(olympian_id: @olympian2.id, event_id: @event1.id, medal: "Bronze")
    @oe3 = OlympianEvent.create(olympian_id: @olympian3.id, event_id: @event1.id, medal: "Gold")
    @oe4 = OlympianEvent.create(olympian_id: @olympian4.id, event_id: @event2.id, medal: "Bronze")
    @oe5 = OlympianEvent.create(olympian_id: @olympian5.id, event_id: @event2.id, medal: "Silver")
    @oe6 = OlympianEvent.create(olympian_id: @olympian6.id, event_id: @event2.id, medal: "Gold")
    @oe7 = OlympianEvent.create(olympian_id: @olympian7.id, event_id: @event3.id, medal: "Gold")
    @oe8 = OlympianEvent.create(olympian_id: @olympian1.id, event_id: @event3.id, medal: "NA")
  end

  it "sends a list of sports and their events" do

    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body)

    expect(events["events"].first.keys).to eq(["sport", "events"])
    expect(events["events"].first["sport"]).to eq("Gymnastics")
    expect(events["events"].first["events"]).to be_a(Array)
    expect(events["events"].first["events"].first).to eq("Gymnastics Men's Individual All-Around")
  end

  it "sends a list of medalists for a specific event" do

    get "/api/v1/events/#{@event1.id}/medalists"

    expect(response).to be_successful

    medalists = JSON.parse(response.body)
    attributes = ["name", "team", "age", "medal"]

    expect(medalists["medalists"]).to be_a(Array)
    expect(medalists["medalists"].first).to be_a(Hash)
    expect(medalists["medalists"].first).to be_a(Hash)
    expect(medalists["event"]).to eq("Gymnastics Men's Individual All-Around")
    expect(medalists["medalists"].first.keys).to eq(attributes)
  end

  it "sends a message no medalist for event if no medalist" do

    get "/api/v1/events/#{@event8.id}/medalists"

    expect(response).to be_successful

    message = response.body

    expect(message).to eq("There were no medalists for that event.")
  end
end
