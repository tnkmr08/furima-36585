FactoryBot.define do
  factory :order_ship do
    postcode {'123-4567'}
    prefecture_id {2}
    city {'横浜市'}
    block {'青山1-1-1'}
    building {'柳ビル101'}
    telephone_number {'09012345678'}
    token {'tok_abcdefghijk00000000000000000'}
  end
end
