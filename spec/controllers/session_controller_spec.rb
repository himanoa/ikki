# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionController, type: :controller do # rubocop:disable Matrics/BlockLength
  before :all do
    @user = User.create(name: 'himanoa', email: 'poe@gmail.com',
                        password: 'poepoepo', password_confirmation: 'poepoepo')
  end
  describe 'POST#create' do
    it '200 when username pattern valid' do
      user = {
        name: 'himanoa',
        password: 'poepoepo'
      }
      response = post(:create, user)
      expect(response.status).to eq(200)
      expect(response.cookies['_session_id']).not_to eq(nil)
    end
    it '200 when email pattern valid' do
      user = {
        name: 'poe@gmail.com',
        password: 'poepoepo'
      }
      response = post(:create, user)
      expect(response.status).to eq(200)
      expect(response.cookies['_session_id']).not_to eq(nil)
    end
    it '400 when username invalid' do
      user = {
        name: 'h1manoa',
        password: 'poepoepo'
      }
      response = post(:create, user)
      expect(response.status).to eq(400)
      expect(response.cookies['_session_id']).to eq(nil)
    end
    it '400 when password invalid' do
      user = {
        name: 'h1manoa',
        password: 'p0ep0ep0'
      }
      response = post(:create, user)
      expect(response.status).to eq(400)
      expect(response.cookies['_session_id']).to eq(nil)
    end
    it '400 when email invalid' do
      user = {
        name: 'p0e@gmail.com',
        password: 'p0ep0ep0'
      }
      response = post(:create, user)
      expect(response.status).to eq(400)
      expect(response.cookies['_session_id']).to eq(nil)
    end
  end
end
