namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 phone_number: "(312) 14 39 445",
                 mobile_phone: "(312) 14 39 445",
                 address: "Fernandez de Lizardi 580",
                 rfc: "ekfjbrekfj",
                 state_id: "1",
                 city_id: "1",
                 password: "foobar",
                 password_confirmation: "foobar")
     admin.toggle!(:admin)
      
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      phone = "(312) 14 39 445#{n+1}"
      mobile_phone = "(312) 14 39 445#{n+1}"
      address = "Lomas-#{n+1}"
      rfc = "ufydjhfv#{n+1}"
      state = "1"
      city = "1"
      User.create!(name: name,
                   email: email,
                   phone_number: phone,
                   mobile_phone: mobile_phone,
                   address: address,
                   rfc: rfc,
                   state_id: state,
                   city_id: city,
                   password: password,
                   password_confirmation: password)
    end
    
    40.times do |n|
      name = "State-#{n+1}"
      State.create!(name:name)
    end
    
    40.times do |n|
      state_id = n,
      name = "City-#{n+1}"
      City.create!(name:name, state_id: state_id)
    end
  end
end