# frozen_string_literal: true

class Entry < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :body_md, presence: true
  validates :updated_at, presence: true
end
