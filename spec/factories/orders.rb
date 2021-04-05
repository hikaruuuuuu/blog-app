FactoryBot.define do
  factory :order do
    f_name          { Gimei.first.kanji }
    l_name          { Gimei.last.kanji }
    f_name_kana     { Gimei.first.hiragana }
    l_name_kana     { Gimei.last.hiragana }
    postal_code     { '123-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id   { Faker::Number.between(from: 1, to: 47) }
    city            { Gimei.city.kanji }
    building_number { Faker::Address.building_number }
    building_name   { Gimei.town.kanji  }
    phone_number    { Faker::Number.leading_zero_number(digits: 11) }
    token           { Faker::Number.hexadecimal(digits: 10) }
  end
end
