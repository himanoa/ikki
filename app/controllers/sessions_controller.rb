# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to(:root) and  return
    end
    render :new
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
