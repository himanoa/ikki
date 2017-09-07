# frozen_string_literal: true

class EntryDecorator < Draper::Decorator
  delegate_all

  FORMAT = '%Y/%m/%d %H:%M:%S'

  def format_updated_at
    model.created_at.strftime(FORMAT)
  end

  def format_created_at
    model.created_at.strftime(FORMAT)
  end

  def description
    "#{model.to_html.css('p').reduce([]) { |_, val| val.children.to_s }.slice(0..51)}…"
  end
end
