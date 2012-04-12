FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    phone_number "(312) 1439445"
    address "Fernandez de Lizardi 580"
    state "Colima"
    city "Colima"
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
  end
end
