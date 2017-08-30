# frozen_string_literal: true

class EntriesController < ApplicationController
  include Sessionable
  def new; end
  def show; end

  def create
    entry = @user.entries.build(
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

  def edit; end

  def destroy
    entry = @user.entries.find_by(id: params[:id])
    if entry
      entry.destroy
      head 200
      return
    end
    head 400
  end
end
