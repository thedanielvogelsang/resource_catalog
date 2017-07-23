FactoryGirl.define do
  factory :sharable do
    sequence :sharable do |i|
       "#{i}MyText"
     end
  end
end
