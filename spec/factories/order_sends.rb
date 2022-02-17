FactoryBot.define do
  factory :order_send do
    post_code  { '111-1111' }
    municipalities  { '周南市' }
    address   { '徳山' }
    tel     { '1234567890' }
    prefecture_id  { '2' }
    building  { 'マンション101号室' }

    token  {"tok_abcdefghijk00000000000000000"}

  end
end
