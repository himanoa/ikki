# frozen_string_literal: true

class Entry < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :is_hidden, inclusion: { in: [true, false] }
  belongs_to :user

  def to_html
    pipeline = HTML::Pipeline.new([
                                    HTML::Pipeline::MarkdownFilter,
                                    HTML::Pipeline::RougeFilter
                                  ])
    pipeline.call(body)[:output]
  end

  def format_updated_at
    created_at.strftime(FORMAT)
  end

  def format_created_at
    created_at.strftime(FORMAT)
  end

  def cached_body
    to_html.to_s
  end

  def description
    @short_body = to_html.css('p').reduce([]) { |acc, val| acc << val.children.to_s }[0..-1].join('')
    return "#{@short_body[0..50]}‥" if @short_body.length >= DESC_LENGTH
    @short_body
  end
end
