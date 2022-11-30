FactoryBot.define do
  factory :purchase_address do
    Faker::Config.locale = :ja
    postal_code   { Faker::Address.zip_code }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.state }
    address_line  { Faker::Address.street_address }
    building      { '東京ハイツ' }
    phone_number  { Faker::PhoneNumber.cell_phone.gsub(/-/, '') }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
