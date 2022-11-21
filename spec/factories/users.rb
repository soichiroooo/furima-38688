FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname        {Faker::Internet.user_name}
    email           {Faker::Internet.free_email}
    password        {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name      {gimei.first.kanji}
    last_name       {gimei.last.kanji}
    first_name_kana {gimei.first.katakana}
    last_name_kana  {gimei.last.katakana}
    date_of_birth   {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end