FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    phone 1
    email "MyString"
    address "MyText"
    zipcode 1
    password_digest "MyString"
    role 0
  end
end
