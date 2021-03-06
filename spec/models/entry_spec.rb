# frozen_string_literal: true

require 'rails_helper'
require 'rss'

RSpec.describe Entry, type: :model do
  let(:user) do
    FactoryGirl.build(:user) do |u|
      u.entries.build(FactoryGirl.attributes_for(:entry))
    end
  end
  context 'title' do
    it 'is not nil' do
      user.entries[0].title = nil
      expect(user.entries[0]).not_to be_valid
      expect(user.entries[0].errors[:title]).to be_present
    end
  end
  context 'body' do
    it 'is not nil' do
      user.entries[0].body = nil
      expect(user.entries[0]).not_to be_valid
      expect(user.entries[0].errors[:body]).to be_present
    end
  end
  context 'is_hidden' do
    it 'is not nil' do
      user.entries[0].is_hidden = nil
      expect(user.entries[0]).not_to be_valid
    end
  end

  context '#to_html' do
    it 'should be convert to html' do
      user.entries.first.body = '# Hello world'
      expect(user.entries.first.to_html.to_s).to eq '<h1>Hello world</h1>'
    end
  end

  context '#to_rss' do
    it 'should be convert to rss' do
      expect(Entry.to_rss.class).to eq(RSS::Rss)
    end
  end
end
