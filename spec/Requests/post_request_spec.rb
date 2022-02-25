require 'rails_helper'

RSpec.describe 'Post Requests', type: :request do
  # Test suite for GET /posts
  describe 'GET /posts' do
    # make HTTP get request before each example
    before { get '/posts' }

    it 'returns posts' do
      # DONE: build `json` as custom helper to parse JSON responses
      expect(json).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /posts
  describe 'POST /posts' do
    let(:valid_attributes) { { content: 'Fifteen birds in five fir trees' } }

    context 'when the request is valid' do
      before { post '/posts', params: valid_attributes }

      it 'creates a post' do
        expect(json['content']).to eq('Fifteen birds in five fir trees')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/posts', params: { content: '"The wind was on the withered heath"' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end
end
