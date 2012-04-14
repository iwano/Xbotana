FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    phone_number "(312) 1439445"
    mobile_phone "(312) 1439445"
    address "Fernandez de Lizardi 580"
    rfc "12u4y359g4"
    password "foobar"
    password_confirmation "foobar"
    state "1"
    city "1"
    
    factory :admin do
      admin true
    end
  end
end
