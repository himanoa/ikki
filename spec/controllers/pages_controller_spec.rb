# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET#index' do
    it 'return template index.html.erb' do
      get :index
      expect(response.body).to render_template('pages/index')
    end
  end
end
