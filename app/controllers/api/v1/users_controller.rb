class Api::V1::UsersController < ApplicationController

  def create
   if params[:password] == params[:password_confirmation]
     user = User.create(user_params)
     if user.save
      user.update(auth_token: user.generate_auth_token)
       render json: UserSerializer.new(user), status: 201
     else
       render json: { errors: user.errors.full_messages }, status: 400
     end
   else
     render json: { errors: "Passwords do not match" }, status: 400
   end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end