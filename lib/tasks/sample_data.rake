namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 phone_number: "(312) 14 39 445",
                 address: "Fernandez de Lizardi 580",
                 state: "Colima",
                 city: "Colima",
                 password: "foobar",
                 password_confirmation: "foobar")
     admin.toggle!(:admin)
      
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      phone = "(312) 14 39 445#{n+1}"
      address = "Lomas-#{n+1}"
      state = "Colima"
      city = "Colima"
      User.create!(name: name,
                   email: email,
                   phone_number: phone,
                   address: address,
                   state: state,
                   city: city,
                   password: password,
                   password_confirmation: password)
    end
  end
end