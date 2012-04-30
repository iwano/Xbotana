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
     
     name = "Angel David Garcia Rodriguez"
     email = "angel_antifashion@hotmail.com"
     password  = "robotcagahelado"
     phone = "(312) 161 24 29"
     mobile_phone = "(312) 315 87 63"
     address = "Alla en la verga por villaescali"
     rfc = "sepa la chingada"
     state = "1"
     city = "3"
     vendor = User.create!(name: name,
                  email: email,
                  phone_number: phone,
                  mobile_phone: mobile_phone,
                  address: address,
                  rfc: rfc,
                  state_id: state,
                  city_id: city,
                  password: password,
                  password_confirmation: password)
      vendor.toggle!(:vendor)
                   
      name  = "Jose Artuto Macias Herrera"
      email = "tohafire@hotmail.com"
      password  = "quenomehablo"
      phone = "(312) 161 24 29"
      mobile_phone = "(312) 130 41 76"
      address = "Fatimas"
      rfc = "rlikryg34o8r"
      state = "1"
      city = "3"
      vendor = User.create!(name: name,
                   email: email,
                   phone_number: phone,
                   mobile_phone: mobile_phone,
                   address: address,
                   rfc: rfc,
                   state_id: state,
                   city_id: city,
                   password: password,
                   password_confirmation: password)
    vendor.toggle!(:vendor)
                   
     name  = "Nestor Julian Morales Cardenas"
     email = "caballeroaguila_22@hotmail.com"
     password  = "elenganadosoy"
     phone = "(312) 345 54 54"
     mobile_phone = "(312) 131 80 87"
     address = "Atrasito de la facu"
     rfc = "krjhfo47fo4jebf"
     state = "1"
     city = "1"
     hos = User.create!(name: name,
                  email: email,
                  phone_number: phone,
                  mobile_phone: mobile_phone,
                  address: address,
                  rfc: rfc,
                  state_id: state,
                  city_id: city,
                  password: password,
                  password_confirmation: password)
    hos.toggle!(:hos)
                  
    name  = "Ricardo Enrique Castaneda Barajas"
    email = "ricardoenrique_111@hotmail.com"
    password  = "teamoyana"
    phone = "(312) 131 80 87"
    mobile_phone = "(312) 154 61 55"
    address = "No tengo casa"
    rfc = "erkjfo47fgrjk"
    state = "1"
    city = "4"
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
                  
      
    5.times do |n|
      name  = Faker::Name.name
      email = "example#{n+1}@client.org"
      password  = "password"
      phone = "(355) 35 55 555"
      mobile_phone = "(355) 35 55 555"
      address = Faker::Address.street_address
      rfc = "ufydjhfv#{n+1}"
      state = "1"
      city = n+1
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
        email = "example#{n+6}@client.org"
        password  = "password"
        phone = "(355) 35 55 555"
        mobile_phone = "(355) 35 55 555"
        address = Faker::Address.street_address
        rfc = "ufydjhfv#{n+1}"
        state = "2"
        city = n+1
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
          email = "example#{n+11}@client.org"
          password  = "password"
          phone = "(355) 35 55 555"
          mobile_phone = "(355) 35 55 555"
          address = Faker::Address.street_address
          rfc = "ufydjhfv#{n+1}"
          state = "3"
          city = n+1
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
            email = "example#{n+20}@client.org"
            password  = "password"
            phone = "(355) 35 55 555"
            mobile_phone = "(355) 35 55 555"
            address = Faker::Address.street_address
            rfc = "ufydjhfv#{n+1}"
            state = "4"
            city = n+1
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
              email = "example#{n+30}@client.org"
              password  = "password"
              phone = "(355) 35 55 555"
              mobile_phone = "(355) 35 55 555"
              address = Faker::Address.street_address
              rfc = "ufydjhfv#{n+1}"
              state = "5"
              city = n+1
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
                email = "example#{n+40}@client.org"
                password  = "password"
                phone = "(355) 35 55 555"
                mobile_phone = "(355) 35 55 555"
                address = Faker::Address.street_address
                rfc = "ufydjhfv#{n+1}"
                state = "6"
                city = n+1
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
                  email = "example#{n+50}@client.org"
                  password  = "password"
                  phone = "(355) 35 55 555"
                  mobile_phone = "(355) 35 55 555"
                  address = Faker::Address.street_address
                  rfc = "ufydjhfv#{n+1}"
                  state = "7"
                  city = n+1
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
      
      name = "Popcorn"
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
      
      name = "Doritos"
      category = "1"
      lot = "1"
      quantity = "150"
      description = "Crunchy chili cheese nachos"
      price = "7.50"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "Doritos"
      category = "1"
      lot = "1"
      quantity = "250"
      description = "Crunchy chili cheese nachos"
      price = "13"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "Doritos"
      category = "1"
      lot = "1"
      quantity = "550"
      description = "Crunchy chili cheese nachos"
      price = "19.50"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "japanese peanuts"
      category = "3"
      lot = "2"
      quantity = "320"
      description = "Salty and amazing"
      price = "12.50"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "japanese peanuts"
      category = "3"
      lot = "2"
      quantity = "120"
      description = "Salty and amazing"
      price = "7.50"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "japanese peanuts"
      category = "3"
      lot = "2"
      quantity = "269"
      description = "Salty and amazing"
      price = "20"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "Extra butter popcorn"
      category = "2"
      lot = "3"
      quantity = "300"
      description = "A flavor explosion"
      price = "10"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "Extra butter popcorn"
      category = "2"
      lot = "3"
      quantity = "290"
      description = "A flavor explosion"
      price = "7.20"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "Extra butter popcorn"
      category = "2"
      lot = "3"
      quantity = "500"
      description = "A flavor explosion"
      price = "4.80"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

  end
end