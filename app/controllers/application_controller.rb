# frozen_string_literal: true

class ApplicationController < ActionController::Base


    before_action :retrieve_access_token


    def retrieve_access_token
        session[:fintual_token] = ApiModule.retrieve_user_token["data"]["attributes"]["token"] unless session[:fintual_token] 
    end
end
