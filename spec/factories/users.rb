FactoryGirl.define do
  factory :user do
    sequence :username do |i|
      "DVOG#{i}"
    end
    first_name "FirstName"
    last_name "LastName"
    phone 1
    email "myemail@gmail.com"
    address "myaddress"
    zipcode 1
    password "MyString"
    password_confirmation "MyString"
    role 0
  end
end
