require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create(content: 'Hello there!') }
  describe 'Validations' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of({ maximum: 1000 }) }
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
