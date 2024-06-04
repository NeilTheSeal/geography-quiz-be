require "rails_helper"
require "json"

json_response = JSON.parse(
  File.read("./spec/resources/rest_countries.json"),
  symbolize_names: true
)

RSpec.describe Country do
  it "has attributes" do
    country_data = json_response.first
    country = Country.new(country_data)

    expect(country.name[:common]).to eq("Angola")
    expect(country.cca3).to eq("AGO")
    expect(country.un_member).to eq(true)
    expect(country.currencies.keys).to eq([:AOA])
    expect(country.capital[0]).to eq("Luanda")
    expect(country.region).to eq("Africa")
    expect(country.sub_region).to eq("Middle Africa")
    expect(country.languages.keys).to eq([:por])
    expect(country.landlocked).to eq(false)
    expect(country.area).to eq(1_246_700)
    expect(country.population).to eq(32_866_268)
    expect(country.borders).to eq(%w[COG COD ZMB NAM])
    expect(country.flag_url).to be_a(String)
    expect(country.map_url).to be_a(String)
    expect(country.drive_side).to eq("right")
    expect(country.coat_of_arms_url).to be_a(String)
  end
end
