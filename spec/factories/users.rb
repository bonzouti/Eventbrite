FactoryBot.define do
  factory :user do
    email { "MyString" }
    encrypted_password { "MyString" }
    description { "MyText" }
    first_name { "MyString" }
    last_name { "MyString" }
  end
end
