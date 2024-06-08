class UsersService
  def initialize
    @url = if Rails.env.production?
             "https://secret-citadel-94988-86e2ffef1cda.herokuapp.com"
           else
             "http://localhost:3000"
           end
  end

  def valid_user?(user_id)
    conn = Faraday.new(url: @url) do |faraday|
      faraday.headers["Accept"] = "application/json"
      faraday.params["user_id"] = user_id
    end

    response = conn.get("/is-user-valid")

    JSON.parse(response.body)
  end
end
