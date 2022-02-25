require 'rails_helper'

RSpec.describe 'Post Requests', type: :request do
  # Test suite for GET /posts
  describe 'GET /posts' do
    # make HTTP get request before each example
    before { get '/posts' }

    it 'returns posts' do
      # TODO: buils `json` as custom helper to parse JSON responses
    #   expect(json).not_to be_empty
    #   expect(json.size).to eq(size.to_num) #Set size
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
