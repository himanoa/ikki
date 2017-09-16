# frozen_string_literal: true

class EntryDecorator < Draper::Decorator
  delegate_all

  FORMAT = '%Y/%m/%d %H:%M:%S'
  DESC_LENGTH = 49

  def format_updated_at
    model.created_at.strftime(FORMAT)
  end

  def format_created_at
    model.created_at.strftime(FORMAT)
  end

  def cached_body
    model.to_html.to_s
  end

  def description
    @short_body = model.to_html.css('p').reduce([]) { |acc, val| acc << val.children.to_s }[1..-1].join('')
    return "#{@short_body[0..50]}‥" if @short_body.length >= DESC_LENGTH
    @short_body
  end
end
