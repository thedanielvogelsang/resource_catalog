FactoryGirl.define do
  factory :community do
    sequence :name do |i|
       "#{i}MyCommunity"
     end
    description "community-info"
  end
end
