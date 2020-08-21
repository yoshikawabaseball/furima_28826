class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |_username, password|
      userid == ENV['BASIC_AUTH_ID'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
