FactoryBot.define do
  factory :attendance do
    stripe_customer_id { "MyString" }
    user { FactoryBot.create(:user) }  
    event { FactoryBot.create(:event) }
  end
end
