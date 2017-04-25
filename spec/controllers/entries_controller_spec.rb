# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  describe 'POST# create' do
    # context 'logined' do
    #   before do
    #     session["user_id"] = user.id
    #   end
    #   it 'return success when created entries' do
    #     post :create, FactoryGirl.build(:entry).attributes
    #     expect(response).to have_http_status(201)
    #     expect(Entry.count).to eq(1)
    #     expect(Entry.first.user.id).to eq(user.id)
    #   end
    # end
    context 'loggout' do
      before do
        session["user_id"] = nil
      end
      it 'return fail when created entries' do
        post :create, FactoryGirl.build(:entry).attributes
        expect(response).to have_http_status(403)
        expect(Entry.count).to eq(0)
      end
    end
  end
end
