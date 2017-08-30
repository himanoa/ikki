# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  describe 'POST# create' do
    context 'logined' do
      before do
        session['user_id'] = user.id
      end
      it 'return success when created entries' do
        post :create, FactoryGirl.build(:entry).attributes
        expect(response).to have_http_status(201)
        expect(Entry.count).to eq(1)
        expect(Entry.first.user.id).to eq(user.id)
      end
    end
    context 'loggout' do
      before do
        session['user_id'] = nil
      end
      it 'return fail when created entries' do
        post :create, FactoryGirl.build(:entry).attributes
        expect(response).to have_http_status(302)
        expect(Entry.count).to eq(0)
      end
    end
  end
  describe 'PUT#update' do
    context 'loggined' do
      before do
        session['user_id'] = user.id
        @entry = user.entries.build(FactoryGirl.attributes_for(:entry))
        @entry.save
      end
    end
  end
  describe 'DELETE#destroy' do
    context 'loggined' do
      before do
        session['user_id'] = user.id
        @entry = user.entries.build(FactoryGirl.attributes_for(:entry))
        @entry.save
      end
      it 'return success when deleted entry' do
        delete :destroy, id: @entry.id
        expect(response).to have_http_status(200)
        expect(Entry.count).to eq(0)
      end
      it 'return fail when deleted entry' do
        delete :destroy, id: @entry.id
        delete :destroy, id: @entry.id
        expect(response).to have_http_status(400)
        expect(Entry.count).to eq(0)
      end
    end
    context 'loggouted' do
      before do
        session['user_id'] = nil
        @entry = user.entries.build(FactoryGirl.attributes_for(:entry))
        @entry.save
      end
      it 'return fail when session is nil' do
        delete :destroy, id: @entry.id
        expect(response).to have_http_status(302)
        expect(Entry.count).to eq(1)
      end
    end
  end
end
