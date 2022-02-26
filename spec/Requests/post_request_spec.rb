require 'rails_helper'
require 'faker'

RSpec.describe 'Post Requests', type: :request do
  before :each do
    allow(controller).to receive(:current_user).and_return(FactoryBot.create(:user))
  end

  let(:post) { @current_user.posts.new(FactoryBot.create(:post)) }

  # Test suite for GET /posts
  describe 'GET /posts' do
    # make HTTP get request before each example
    before { get '/posts', as: :json }

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
    let(:post) { Post.create(content: Faker::Fantasy::Tolkien.poem) }

    context 'when the request is valid' do
      before { post '/posts', params: post.to_json, as: :json }

      it 'creates a post' do
        expect(json['content']).to eq('Fifteen birds in five fir trees')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/posts', params: { content: 'The wind was on the withered heath' }, as: :json }

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
