# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST#create' do
    context 'return status' do
      it 'return status code 400 when password_confirmation not equal password' do
        user = {
          name: 'poe',
          email: 'example@example.com',
          password: 'poe',
          password_confirmation: 'p'
        }
        response = post(:create, user: user)
        expect(response.status).to eq(400)
      end
      it 'return status code 201' do
        response = post(:create,
          user: FactoryGirl.attributes_for(:user))
        expect(response).to be_success
        expect(response.status).to eq(201)
      end
    end
    context 'database count check' do
      it 'saves the new user in the database' do
        response = post(:create,
          user: FactoryGirl.attributes_for(:user))
        expect(response).to be_success
        expect(User.count).to eq(1)
      end
    end
  end
end
