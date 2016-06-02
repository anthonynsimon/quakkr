require 'rails_helper'

describe PostsHelper do
  describe '#likers_of(post)' do
    it 'returns the user who likes the post as singular'
    it 'returns the users who likes the post as plural'
  end

  describe '#like_button_for(post)' do
    it 'returns the like button if user has not yet liked the post'
    it 'returns the unlike button if user has already liked the post'
  end
end
