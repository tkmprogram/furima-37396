FactoryBot.define do
  factory :item do
    category_id         {'2'}
    situation_id        {'2'}
    shipping_charge_id  {'2'}
    prefecture_id       {'2'}
    send_day_id         {'2'}
    price               {'1000'}
    title               {'test'}
    explanation         {'test'}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
