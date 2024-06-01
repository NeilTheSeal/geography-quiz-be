require "rails_helper"

RSpec.describe RestCountriesService do

  describe '#class methods' do
    it 'all_countries returns all countries as poros' do
      VCR.use_cassette("all_countries", serialize_with: :json) do
        countries = RestCountriesService.all_countries

        countries.each do |country| 
          expect(country).to be_a(Country)
          expect(country.name.nil?).to eq(false)
          expect(country.cca3.nil?).to eq(false)
          expect(country.flag_url.nil?).to eq(false)
          expect(country.map_url.nil?).to eq(false)
        end
      end
    end
  end
end