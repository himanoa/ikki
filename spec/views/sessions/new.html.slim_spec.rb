# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sessions/new.html.slim', type: :view do
  before do
    render
  end

  it 'exists form' do
    expect(response).to include('form')
  end
  it 'exists input' do
    expect(response).to include('input')
  end
end
