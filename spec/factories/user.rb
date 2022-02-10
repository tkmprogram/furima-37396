FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { person.first.kanji }
    first_name            { person.last.kanji }
    last_name_katakana    { person.first.katakana }
    first_name_katakana   { person.last.katakana }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
