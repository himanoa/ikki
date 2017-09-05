# frozen_string_literal: true

class EntriesController < ApplicationController
  include Sessionable

  def index
    @entries = Entry.where(is_hidden: false).order(created_at: :desc).page(params[:page])
  end

  def new
    @entry = @user.entries.build
  end

  def show
    @entry = Entry.find(params[:id]).decorate
  end

  def create
    head 201 if @user.entries.build(entry_params).save
  end

  def edit
    @entry = Entry.find_by(id: params[:id])
    return head 404 unless @entry
    render :edit
  end

  def update
    return head 204 if Entry.find(params[:id]).update(entry_params)
    head 400
  end

  def destroy
    entry = @user.entries.find_by(id: params[:id])
    if entry
      entry.destroy
      head 200
      return
    end
    head 400
  end

  private

  def entry_params
    params.require(:entry).permit(:id, :title, :body, :is_hidden)
  end
end
