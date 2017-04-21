# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    before do
      User.create(name: 'himanoa', email: 'matsunoappy@gmail.com', password: 'a', password_confirmation: 'a')
    end
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'returns renderer template equal new' do
      get :new
      p response.body
      expect(response).to have_http_status(:success)
      expect(response.body).to render_template('sessions/new')
    end
  end
  describe 'DELETE #destroy' do
    before do
      add_session(user_id: 1)
      delete :destroy
    end
    it 'redirect to root_path' do
      expect(response).to have_http_status(302)
      expect(response.body).to redirect_to(:root)
    end
    it 'passed when session cleaned' do
      expect(session['user_id']).to eq(nil)
    end
  end
end
