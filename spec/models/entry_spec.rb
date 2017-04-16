# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :model do
  let(:user) do
    user = FactoryGirl.build(:user) do |u| # rubocop:disable Lint/UselessAssignment
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
  context 'body_md' do
    it 'is not nil' do
      user.entries[0].body_md = nil
      expect(user.entries[0]).not_to be_valid
      expect(user.entries[0].errors[:body_md]).to be_present
    end
  end
  context 'updated_at' do
    it 'is not nil' do
      user.entries[0].updated_at = nil
      expect(user.entries[0]).not_to be_valid
      expect(user.entries[0].errors[:updated_at]).to be_present
    end
  end
end
