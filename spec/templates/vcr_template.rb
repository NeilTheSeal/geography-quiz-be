require "rails_helper"

RSpec.describe "Whatever", type: :feature do
  it "whatever" do
    VCR.use_cassette("name_of_cassette", serialize_with: :json) do |cassette|
      visit "/uri"

      body = JSON.parse(
        cassette.serializable_hash.dig(
          "http_interactions", 0, "response", "body", "string"
        ),
        symbolize_names: true
      )

      expect(body).to eq({ key: "value" })
    end
  end
end
