require 'rails_helper'

describe Post do
  it 'is invalid without a user_id'
  it 'is invalid without a message'
  it 'is invalid if message is too short'
  it 'has many comments'
  it 'has many notifications'
  it 'returns posts by specified users via #by_users'
end