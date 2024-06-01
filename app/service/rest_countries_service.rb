class RestCountriesService 
  def self.all_countries
    conn = Faraday.new(url: "https://restcountries.com") do |faraday|
      faraday.headers["Accept"] = "application/json"
    end

    response = conn.get("/v3.1/all")
    json = JSON.parse(response.body, symbolize_names: true)

    json.map do |country_data|
      Country.new(country_data)
    end
  end
end