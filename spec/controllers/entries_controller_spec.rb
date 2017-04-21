# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  describe 'POST# create' do
    context 'logined' do
      before do
        session = { user_id: 2 }
        add_session(session)
      end
      it 'return success when created entries' do
        post :create, FactoryGirl.build(:entries).attribute
        expect(response).to have_http_status(201)
        expect(Entries.count).to eq(1)
        expect(Entries.first.user.id).to eq(2)
      end
    end
    context 'loggout' do
      before do
        session = { user_id: nil }
        add_session(session)
      end
      it 'return fail when created entries' do
        expect(response).to have_http_status(403)
        expect(Entries.count).to eq(0)
      end
    end
  end
end
