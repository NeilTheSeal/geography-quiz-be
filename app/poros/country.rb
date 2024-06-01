class Country 
  attr_reader :name, :cca3, :un_member, :currencies, :capital,
              :region, :sub_region, :languages, :landlocked, :borders,
              :area, :flag_url, :map_url, :population, :drive_side, :coat_of_arms_url
  def initialize(attrs)
    @name = attrs[:name]
    @cca3 = attrs[:cca3]
    @un_member = attrs[:unMember]
    @currencies = attrs[:currencies]
    @capital = attrs[:capital]
    @region = attrs[:region]
    @sub_region = attrs[:subregion]
    @languages = attrs[:languages]
    @landlocked = attrs[:landlocked]
    @borders = attrs[:borders]
    @area = attrs[:area]
    @flag_url = attrs[:flags][:svg]
    @map_url = attrs[:maps][:googleMaps]
    @population = attrs[:population]
    @drive_side = attrs[:car][:side]
    @coat_of_arms_url = attrs[:coatOfArms][:svg]
  end
end