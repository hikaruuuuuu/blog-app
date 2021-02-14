FactoryBot.define do
  factory :article do
    title         {Faker::Lorem.word}
    text          {Faker::Lorem.paragraph}
    buy_setting   {Faker::Boolean.boolean}
    price         {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test.jpeg'), filename: 'test_image.png')
    end

  end
end

# not_to allow_value