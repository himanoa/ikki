# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @user = User.new(email: params[:user][:email],
                     name: params[:user][:name],
                     password: params[:user][:password],
                     password_confirmation: params[:user][:password_confirmation])
    if @user.save
      head :created
    else
      head 400
    end
  end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
