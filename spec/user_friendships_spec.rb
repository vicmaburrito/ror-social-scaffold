require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :feature do
# User 1
let(:user1) {User.create(name: 'Juan', email: 'user@example.com', password: 'admin123')}
end