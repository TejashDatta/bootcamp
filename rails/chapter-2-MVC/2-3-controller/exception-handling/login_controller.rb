class LoginController < ApplicationController
  def create
    @user = User.where(name: params[:name], password: params[:password]).find
    raise LoginFailed unless @user
  end
end
