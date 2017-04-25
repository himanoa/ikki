# frozen_string_literal: true

FactoryGirl.define do
  factory :entry do
    title 'MyString'
    body 'MyText'
    body_md 'MyText'
    updated_at '2017-04-16 02:17:12'
    is_hidden false
  end
end
