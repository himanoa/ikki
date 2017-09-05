# frozen_string_literal: true

class Entry < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :is_hidden, inclusion: { in: [true, false] }
  belongs_to :user

  def to_html
    Rails.cache.fetch("/model/entry/#{id}") do
      pipeline = HTML::Pipeline.new([
        HTML::Pipeline::MarkdownFilter,
        HTML::Pipeline::SyntaxHighlightFilter
      ])
      pipeline.call(body)[:output].to_s
    end
  end

  after_commit do
    Rails.cache.delete("/model/entry/#{id}")
  end
end
