class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
  end
end
