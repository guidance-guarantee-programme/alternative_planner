class ApplicationController < ActionController::Base
  include GDS::SSO::ControllerMethods

  before_action :authenticate_user!

  protect_from_forgery with: :exception

  add_flash_types :success, :notice, :warning
end
