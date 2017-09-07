# frozen_string_literal: true

class EntryDecorator < Draper::Decorator
  delegate_all

  FORMAT = '%Y/%m/%d %H:%M:%S'
  DESC_LENGTH = 49

  CACHE_PREFIX = "#{model.id}-#{model.updated_at}"
  def format_updated_at
    model.created_at.strftime(FORMAT)
  end

  def format_created_at
    model.created_at.strftime(FORMAT)
  end

  def body
    Rails.cache.fetch('decorators/entry/body/#{CACHE_PREFIX}') do
      model.to_html
    end
  end

  def description
    Rails.cache.fetch('decorators/entry/description/#{CACHE_PREFIX}') do
      short_body = model.to_html.css('p').reduce([]) { |_, val| val.children.to_s }.slice(0..DESC_LENGTH)
      next "#{short_body}‥" if short_body.length == DESC_LENGTH
      short_body
    end
  end
end
