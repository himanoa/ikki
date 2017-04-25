# frozen_string_literal: true

class EntriesController < ApplicationController
  def new; end

  def create
    user = check_login
    if user
      entry = User.find_by(id: user).entries.build(
        title: params[:title],
        body: params[:body],
        body_md: params[:body_md],
        updated_at: params[:updated_at],
        is_hidden: params[:is_hidden]
      )
      if entry.save
        head 201
        return
      end
      head 400
    end
    head 403
  end

  def edit; end
end
