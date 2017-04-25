# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    name 'MyString'
    email 'MyString@mystring.org'
    password 'MyString'
    password_confirmation 'MyString'
  end
end
