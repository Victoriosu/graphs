class Graph < ApplicationRecord
    include ApiModule


    def self.get_goals_from_api
        response = ApiModule.get("/goals")
    end
end
