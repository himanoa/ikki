class SitemapJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.application.load_tasksend
    Rake::Task['sitemap:refresh'].invoke
  end
end
