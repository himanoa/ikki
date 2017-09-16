class SitemapJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.application.load_tasks
    Rake::Task['sitemap:refresh'].invoke
  end
end
