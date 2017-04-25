# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def check_login
    User.find_by(id: session[:user_id])
  end
end
