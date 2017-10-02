# frozen_string_literal: true

require 'rss'

class Entry < ApplicationRecord
  FORMAT = '%Y/%m/%d %H:%M:%S'
  DESC_LENGTH = 49

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
    @short_body = to_html.css('p').reduce([]) { |acc, val| acc << val.children.text }[0..-1].join('')
    return "#{@short_body[0..50]}‥" if @short_body.length >= DESC_LENGTH
    @short_body
  end

  def self.to_rss
    RSS::Maker.make('2.0') do |rss|
      rss.channel.title = I18n.t('meta.site.name')
      rss.channel.link = ApplicationRecord::BASE_URL
      rss.channel.about = ApplicationRecord::BASE_URL + '/rss'
      rss.channel.updated = Time.zone.now.to_s(:rfc882)
      rss.channel.description = 'ひまのあが書いている プログラミング JavaScript ゲームレビュー 日誌がメインなサイトです。'

      Entry.all.each do |e|
        rss.items.new_item do |item|
          item.title = e.title
          item.description = e.description
          item.date = e.updated_at.to_s(:rfc882)
          item.link = ApplicationRecord::BASE_URL + Rails.application.routes.url_helpers.entry_path(e.id)
        end
      end
    end
  end
end
