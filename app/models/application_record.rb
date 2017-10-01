# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  BASE_URL = 'https://blog.himanoa.net'
end
