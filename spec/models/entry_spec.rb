# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :model do
  before do
    @entry = FactoryGirl.build(:entry)
  end
  context 'title' do
    it 'is not nil' do
      @entry.title = nil
      expect(@entry).not_to be_valid
    end
  end
  context 'body' do
    it 'is not nil' do
      @entry.body = nil
      @entry.valid?
      expect(@entry.errors[:body]).to be_present
    end
  end
  context 'body_md' do
    it 'is not nil' do
      @entry.body_md = nil
      @entry.valid?
      expect(@entry.errors[:body_md]).to be_present
    end
  end
  context 'updated_at' do
    it 'is not nil' do
      @entry.updated_at = nil
      @entry.valid?
      expect(@entry.errors[:updated_at]).to be_present
    end
  end
end
