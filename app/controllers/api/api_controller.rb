class Api::ApiController < ActionController::Base

  protect_from_forgery with: :null_session
  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      token == YAML.load_file('config/secrets.yml')[Rails.env]["secret_key_base"]
    end
  end

end