class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:user][:username], params[:user][:password])
    if command.success?
      user = User.find_by(username: params[:user][:username])
      render json: { token: command.result, role: user.role, name: user.username }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
