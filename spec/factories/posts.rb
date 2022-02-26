FactoryBot.define do
  factory :post do
    content { Faker::Fantasy::Tolkien.poem }
  end
end
