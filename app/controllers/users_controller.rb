class UsersController < ApplicationController
  def create
      user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
    )
      if user.save
        render json: { message: "User created successfully" }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :bad_request
      end
    end
    
    
  def show
     if current_user
     user = User.find(params[:id])
       if user.id == current_user.id
        render json: user
       else
        render json: {message: "You must be logged in for access!"}
       end
      end
    end
  end
