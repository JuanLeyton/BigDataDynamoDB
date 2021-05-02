class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    BASE_URL = "https://gk4uyoatcj.execute-api.us-west-2.amazonaws.com/Produccion"
    CREDENTIALS = ENV['AWS_ACCESS_KEY_ID'] + ENV['AWS_SECRET_ACCESS_KEY']
end
