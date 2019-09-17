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

  it "sends a list of sports and their events" do

    get '/api/v1/events'

    expect(response).to be_successful

    events = JSON.parse(response.body)

    expect(events["events"].first.keys).to eq(["sport", "events"])
    expect(events["events"].first["sport"]).to eq("Gymnastics")
    expect(events["events"].first["events"]).to be_a(Array)
    expect(events["events"].first["events"].first).to eq("Gymnastics Men's Individual All-Around")
  end
end
