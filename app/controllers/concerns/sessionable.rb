# frozen_string_literal: true

module Sessionable
  extend ActiveSupport::Concern
  included do
    before_action :login_required, except: %i[show index]
  end

  def login_required
    @user = check_login
    redirect_to login_path unless @user
  end
end
