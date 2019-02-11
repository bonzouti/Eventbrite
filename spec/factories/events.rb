FactoryBot.define do
  factory :event do
    start_date { "2020-02-11 11:19:16" }
    duration { 5 }
    title { "MyString" }
    description { "Jambon de parme car on a besoin de plus de text" }
    price { 1 }
    location { "New York" }
    user { FactoryBot.create(:user) }
  end
end
