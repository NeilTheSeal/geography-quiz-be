require "rails_helper"

RSpec.describe CountryCodes do
  describe "class methods" do
    it "can find country name by code" do
      expect(CountryCodes.country_name).to be_a(Hash)
      expect(CountryCodes.country_name[:AGO]).to eq("Angola")
      expect(CountryCodes.country_name[:KIR]).to eq("Kiribati")
    end
  end
end
