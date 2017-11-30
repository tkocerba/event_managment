FactoryBot.define do
    factory :category do 
        title Faker::Book.title
        description Faker::Book.title
    end
end