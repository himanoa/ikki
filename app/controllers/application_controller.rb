# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def check_login
    redirect_to root_path unless session[:user]
  end
end
