# frozen_string_literal: true

class ApplicationController < ActionController::Base


    before_action :retrieve_access_token


    def retrieve_access_token
        if !session[:fintual_token] 
            session[:fintual_token] = ApiModule.retrieve_user_token["data"]["attributes"]["token"] 
        end
    end
end
