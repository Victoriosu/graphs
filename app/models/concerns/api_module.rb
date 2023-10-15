module ApiModule
    extend ActiveSupport::Concern

    BASE_URL = "https://fintual.cl/api"


    def self.get_goals token
        HTTParty.get(BASE_URL+"/goals", body: { user_email: ENV["FINTUAL_EMAIL"], user_token: token })
    end

    private

    def self.retrieve_user_token
        HTTParty.post(BASE_URL+"/access_tokens", body: {user: { email: ENV["FINTUAL_EMAIL"], password: ENV["FINTUAL_PASSWORD"]}}).parsed_response
    end
end