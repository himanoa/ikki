# frozen_string_literal: true

class RssController < ApplicationController
  def index
    render xml: Entry.to_rss.to_s, status: 200
  end
end
