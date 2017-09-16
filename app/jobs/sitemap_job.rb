# frozen_string_literal: true

class SitemapJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Rails.application.load_tasks
    Rake::Task['sitemap:refresh'].invoke
  end
end
