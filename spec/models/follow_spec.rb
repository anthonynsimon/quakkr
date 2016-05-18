require 'rails_helper'

describe Follow do
  describe '#follower' do
    it 'returns the follower user' do
      is_expected.to belong_to(:follower)
    end
  end
  
  describe '#following' do
    it 'returns the following user' do
      is_expected.to belong_to(:following)
    end
  end
end