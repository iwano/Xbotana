namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Ivan Calderon Vaca",
                 email: "iwano@hotmail.com",
                 phone_number: "(312) 31 38 479",
                 mobile_phone: "(312) 14 39 445",
                 address: "Joaquin Fernandez de Lizardi 580",
                 rfc: "cavih23bfj4490",
                 state_id: "1",
                 city_id: "1",
                 password: "cabron",
                 password_confirmation: "cabron")
     admin.toggle!(:admin)
      
    5.times do |n|
      name  = Faker::Name.name
      email = "example#{n+1}@railstutorial.org"
      password  = "password"
      phone = "(355) 35 55 555"
      mobile_phone = "(355) 35 55 555"
      address = Faker::Address.street_address
      rfc = "ufydjhfv#{n+1}"
      state = "1"
      city = n
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
    
     4.times do |n|
        name  = Faker::Name.name
        email = "example#{n+6}@railstutorial.org"
        password  = "password"
        phone = "(355) 35 55 555"
        mobile_phone = "(355) 35 55 555"
        address = Faker::Address.street_address
        rfc = "ufydjhfv#{n+1}"
        state = "2"
        city = n
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
      
       5.times do |n|
          name  = Faker::Name.name
          email = "example#{n+11}@railstutorial.org"
          password  = "password"
          phone = "(355) 35 55 555"
          mobile_phone = "(355) 35 55 555"
          address = Faker::Address.street_address
          rfc = "ufydjhfv#{n+1}"
          state = "3"
          city = n
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
        
         5.times do |n|
            name  = Faker::Name.name
            email = "example#{n+20}@railstutorial.org"
            password  = "password"
            phone = "(355) 35 55 555"
            mobile_phone = "(355) 35 55 555"
            address = Faker::Address.street_address
            rfc = "ufydjhfv#{n+1}"
            state = "4"
            city = n
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
          
           4.times do |n|
              name  = Faker::Name.name
              email = "example#{n+30}@railstutorial.org"
              password  = "password"
              phone = "(355) 35 55 555"
              mobile_phone = "(355) 35 55 555"
              address = Faker::Address.street_address
              rfc = "ufydjhfv#{n+1}"
              state = "5"
              city = n
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
            
             5.times do |n|
                name  = Faker::Name.name
                email = "example#{n+40}@railstutorial.org"
                password  = "password"
                phone = "(355) 35 55 555"
                mobile_phone = "(355) 35 55 555"
                address = Faker::Address.street_address
                rfc = "ufydjhfv#{n+1}"
                state = "6"
                city = n
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
              
               5.times do |n|
                  name  = Faker::Name.name
                  email = "example#{n+50}@railstutorial.org"
                  password  = "password"
                  phone = "(355) 35 55 555"
                  mobile_phone = "(355) 35 55 555"
                  address = Faker::Address.street_address
                  rfc = "ufydjhfv#{n+1}"
                  state = "7"
                  city = n
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
    
      name = "Colima"
      State.create!(name:name)
      
      name = "Jalisco"
      State.create!(name:name)
      
      name = "Michoacan"
      State.create!(name:name)
      
      name = "Nayarit"
      State.create!(name:name)
      
      name = "Aguascalientes"
      State.create!(name:name)
      
      name = "Guerrero"
      State.create!(name:name)
      
      name = "Guanajuato"
      State.create!(name:name)
      
      40.times do |n|
        name = "State-#{n+1}"
        State.create!(name:name)
      end
      
      name = "Colima"
      state_id = "1"
      City.create!(name:name, state_id: state_id)
      
      name = "Comala"
      state_id = "1"
      City.create!(name:name, state_id: state_id)
      
      name = "Manzanillo"
      state_id = "1"
      City.create!(name:name, state_id: state_id)
      
      name = "Villa de Alvarez"
      state_id = "1"
      City.create!(name:name, state_id: state_id)
      
      name = "Tecoman"
      state_id = "1"
      City.create!(name:name, state_id: state_id)
      
      name = "Zapopan"
      state_id = "2"
      City.create!(name:name, state_id: state_id)
      
      name = "Guadalajara"
      state_id = "2"
      City.create!(name:name, state_id: state_id)
      
      name = "Puerto Vallarta"
      state_id = "2"
      City.create!(name:name, state_id: state_id)
      
      name = "Ciudad Guzman"
      state_id = "2"
      City.create!(name:name, state_id: state_id)
      
      name = "Morelia"
      state_id = "3"
      City.create!(name:name, state_id: state_id)
      
      name = "Morelos"
      state_id = "3"
      City.create!(name:name, state_id: state_id)
      
      name = "Villas del Pedregal"
      state_id = "3"
      City.create!(name:name, state_id: state_id)
      
      name = "Uruapan"
      state_id = "3"
      City.create!(name:name, state_id: state_id)
      
      name = "Zamora"
      state_id = "3"
      City.create!(name:name, state_id: state_id)
      
      name = "Tepic"
      state_id = "4"
      City.create!(name:name, state_id: state_id)
      
      name = "Sayulita"
      state_id = "4"
      City.create!(name:name, state_id: state_id)
      
      name = "Valle de Banderas"
      state_id = "4"
      City.create!(name:name, state_id: state_id)
      
      name = "Rincon de Guayabitos"
      state_id = "4"
      City.create!(name:name, state_id: state_id)
      
      name = "Aguascalientes"
      state_id = "5"
      City.create!(name:name, state_id: state_id)
      
      name = "Calvillito"
      state_id = "5"
      City.create!(name:name, state_id: state_id)
      
      name = "El Ocote"
      state_id = "5"
      City.create!(name:name, state_id: state_id)
      
      name = "Temazcal"
      state_id = "5"
      City.create!(name:name, state_id: state_id)
      
      name = "Chilpancingo"
      state_id = "6"
      City.create!(name:name, state_id: state_id)
      
      name = "Acapulco"
      state_id = "6"
      City.create!(name:name, state_id: state_id)
      
      name = "Taxco"
      state_id = "6"
      City.create!(name:name, state_id: state_id)
      
      name = "Zihuatanejo"
      state_id = "6"
      City.create!(name:name, state_id: state_id)
      
      name = "Ixtapa"
      state_id = "6"
      City.create!(name:name, state_id: state_id)
      
      name = "Guanajuato"
      state_id = "7"
      City.create!(name:name, state_id: state_id)
      
      name = "Leon"
      state_id = "7"
      City.create!(name:name, state_id: state_id)
      
      name = "Irapuato"
      state_id = "7"
      City.create!(name:name, state_id: state_id)
      
      name = "Celaya"
      state_id = "7"
      City.create!(name:name, state_id: state_id)
      
      name = "San Miguel de Allende"
      state_id = "7"
      City.create!(name:name, state_id: state_id)
    
    50.times do |n|
      state_id = n
      name = "City-#{n+1}"
      City.create!(name:name, state_id: state_id)  
    end
    
      name = "Chips"
      Category.create!(name:name)  
      
      name = "Soda drink"
      Category.create!(name:name)
      
      name = "Peanuts"
      Category.create!(name:name)
      
      number = "2000"
      date = "2013-11-10"
      Lot.create!(number:number, expiry_date:date)
      
      number = "3000"
      date = "2014-11-10"
      Lot.create!(number:number, expiry_date:date)
      
      number = "4000"
      date = "2015-11-10"
      Lot.create!(number:number, expiry_date:date)
      
      number = "5000"
      date = "2015-11-10"
      Lot.create!(number:number, expiry_date:date)
      
      name = "80gr"
      Presentation.create!(name:name)
      
      name = "150gr"
      Presentation.create!(name:name)
      
      name = "250gr"
      Presentation.create!(name:name)
  end
end