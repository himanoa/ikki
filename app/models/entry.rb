# frozen_string_literal: true

class Entry < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :body_md, presence: true
  validates :updated_at, presence: true
  validates :is_hidden, inclusion: {in: [true, false]}
  belongs_to :user
end
