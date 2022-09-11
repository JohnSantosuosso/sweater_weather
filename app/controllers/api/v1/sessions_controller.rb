class Api::V1::SessionsController < ApplicationController

  def show
    require 'pry'; binding.pry 
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.start_session(user), status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 401
    end
  end

end