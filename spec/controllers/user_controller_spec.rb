require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST#create' do
    before do
      post :create, user: FactoryGirl.attributes_for(:user)
    end
    it 'saves the new user in the database' do
      expect(response).to be_success
      expect(response).to change(User, :count).by(1)
    end
    it 'return status code 200' do
      expect(response).to be_success
      expect(response.status).to eq(201)
    end
  end
end
