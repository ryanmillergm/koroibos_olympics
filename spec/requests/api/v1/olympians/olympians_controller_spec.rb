require "rails_helper"

describe "olympian API" do
  before :each do
    olympian1 = Olympian.create(name: "John", team: "USA", age: 24, sex: "M", height: 170, weight: 180)
    olympian2 = Olympian.create(name: "Paul", team: "Canada", age: 24, sex: "M", height: 180, weight: 187)
    olympian3 = Olympian.create(name: "Sally", team: "Mexico", age: 24, sex: "F", height: 150, weight: 125)
  end
  it "sends a list of olympians" do

    get '/api/v1/olympians'

    expect(response).to be_successful

    olympians = JSON.parse(response.body)
    attributes = ["id", "name", "team", "age", "sex", "height", "weight"]

    expect(olympians["data"].count).to eq(3)
    expect(olympians["data"].first["attributes"].keys).to eq(attributes)
    expect(olympians["data"].first["attributes"]["name"]).to be_a(String)
    expect(olympians["data"].first["attributes"]["team"]).to be_a(String)
    expect(olympians["data"].first["attributes"]["age"]).to be_a(Integer)
    expect(olympians["data"].first["attributes"]["sex"]).to be_a(String)
    expect(olympians["data"].first["attributes"]["height"]).to be_a(Integer)
    expect(olympians["data"].first["attributes"]["weight"]).to be_a(Integer)
  end
end
