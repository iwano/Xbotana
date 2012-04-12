FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    phone_number "(312) 1439445"
    address "Fernandez de Lizardi 580"
    state "Colima"
    city "Colima"
    password "foobar"
    password_confirmation "foobar"
  end
end
