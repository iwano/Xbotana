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
                 password: "botanax",
                 password_confirmation: "botanax")
     admin.toggle!(:admin)
     
     name = "Angel David Garcia Rodriguez"
     email = "angel_antifashion@hotmail.com"
     password  = "botanax"
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
      password  = "botanax"
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
     password  = "botanax"
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
    password  = "botanax"
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
    
      name = "Chips"
      Category.create!(name:name)  
      
      name = "Popcorn"
      Category.create!(name:name)
      
      name = "Peanuts"
      Category.create!(name:name)

      name = "Dip"
      Category.create!(name:name)

      name = "Chocolate"
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
      date = "2016-04-10"
      Lot.create!(number:number, expiry_date:date)

      number = "6000"
      date = "2017-11-10"
      Lot.create!(number:number, expiry_date:date)

      number = "7000"
      date = "2015-11-10"
      Lot.create!(number:number, expiry_date:date)

      number = "8000"
      date = "2015-04-10"
      Lot.create!(number:number, expiry_date:date)

      number = "9000"
      date = "2016-09-09"
      Lot.create!(number:number, expiry_date:date)

      number = "1010"
      date = "2015-11-10"
      Lot.create!(number:number, expiry_date:date)

      number = "1020"
      date = "2014-12-10"
      Lot.create!(number:number, expiry_date:date)

      number = "1030"
      date = "2014-01-11"
      Lot.create!(number:number, expiry_date:date)

      number = "1040"
      date = "2015-12-10"
      Lot.create!(number:number, expiry_date:date)

      number = "1050"
      date = "2014-03-10"
      Lot.create!(number:number, expiry_date:date)

      number = "1060"
      date = "2016-02-02"
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
      quantity = "500"
      description = "Crunchy chili cheese nachos"
      price = "7.50"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "Doritos"
      category = "1"
      lot = "1"
      quantity = "500"
      description = "Crunchy chili cheese nachos"
      price = "13"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "Doritos"
      category = "1"
      lot = "1"
      quantity = "500"
      description = "Crunchy chili cheese nachos"
      price = "19.50"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "japanese peanuts"
      category = "3"
      lot = "2"
      quantity = "500"
      description = "Salty and amazing"
      price = "12.50"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "japanese peanuts"
      category = "3"
      lot = "2"
      quantity = "500"
      description = "Salty and amazing"
      price = "7.50"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "japanese peanuts"
      category = "3"
      lot = "2"
      quantity = "500"
      description = "Salty and amazing"
      price = "20"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "Extra butter popcorn"
      category = "2"
      lot = "3"
      quantity = "500"
      description = "A flavor explosion"
      price = "10"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "Extra butter popcorn"
      category = "2"
      lot = "3"
      quantity = "500"
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

      name = "Roasted peanuts"
      category = "3"
      lot = "4"
      quantity = "500"
      description = "Round, brown and delicious"
      price = "11.50"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Roasted peanuts"
      category = "3"
      lot = "4"
      quantity = "500"
      description = "Round, brown and delicious"
      price = "17.50"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Roasted peanuts"
      category = "3"
      lot = "4"
      quantity = "500"
      description = "Round, brown and delicious"
      price = "22.00"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Caramel popcorn"
      category = "2"
      lot = "5"
      quantity = "500"
      description = "Sweet and salty at the same time.. its like eating a piece of heaven"
      price = "6.40"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Caramel popcorn"
      category = "2"
      lot = "5"
      quantity = "500"
      description = "Sweet and salty at the same time.. its like eating a piece of heaven"
      price = "10"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Caramel popcorn"
      category = "2"
      lot = "5"
      quantity = "500"
      description = "Sweet and salty at the same time.. its like eating a piece of heaven"
      price = "14"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Cheese dip"
      category = "4"
      lot = "6"
      quantity = "500"
      description = "Obesity here i go!"
      price = "34"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
  
      name = "Cheese dip"
      category = "4"
      lot = "6"
      quantity = "500"
      description = "Obesity here i go!"
      price = "50"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Cheese dip"
      category = "4"
      lot = "6"
      quantity = "500"
      description = "Obesity here i go!"
      price = "60"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Churritos"
      category = "1"
      lot = "7"
      quantity = "500"
      description = "Adictive and fun"
      price = "8.50"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
      
      name = "Churritos"
      category = "1"
      lot = "7"
      quantity = "500"
      description = "Adictive and fun"
      price = "10"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Churritos"
      category = "1"
      lot = "7"
      quantity = "500"
      description = "Adictive and fun"
      price = "12"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Hot nuts"
      category = "3"
      lot = "8"
      quantity = "500"
      description = "Thats what she said"
      price = "9"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Hot nuts"
      category = "3"
      lot = "8"
      quantity = "500"
      description = "Thats what she said"
      price = "14"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Hot nuts"
      category = "3"
      lot = "8"
      quantity = "500"
      description = "Thats what she said"
      price = "17"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Lays"
      category = "1"
      lot = "9"
      quantity = "500"
      description = "Fried yellow potatoe"
      price = "10"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Lays"
      category = "1"
      lot = "9"
      quantity = "500"
      description = "Fried yellow potatoe"
      price = "15"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Lays"
      category = "1"
      lot = "9"
      quantity = "500"
      description = "Fried yellow potatoe"
      price = "20"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "m&ms"
      category = "5"
      lot = "10"
      quantity = "500"
      description = "f%$* Amazing!"
      price = "15"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "m&ms"
      category = "5"
      lot = "10"
      quantity = "500"
      description = "f%$* Amazing!"
      price = "22"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "m&ms"
      category = "5"
      lot = "10"
      quantity = "500"
      description = "f%$* Amazing!"
      price = "30"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Pringles"
      category = "1"
      lot = "11"
      quantity = "500"
      description = "As cool as expensive"
      price = "28.50"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Pringles"
      category = "1"
      lot = "11"
      quantity = "500"
      description = "As cool as expensive"
      price = "35.60"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Pringles"
      category = "1"
      lot = "11"
      quantity = "500"
      description = "As cool as expensive"
      price = "42.80"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Sabripobres"
      category = "1"
      lot = "12"
      quantity = "500"
      description = "Cheapest food money can buy"
      price = "6"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Sabripobres"
      category = "1"
      lot = "12"
      quantity = "500"
      description = "Cheapest food money can buy"
      price = "10"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Sabripobres"
      category = "1"
      lot = "12"
      quantity = "500"
      description = "Cheapest food money can buy"
      price = "13"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Skippy peanutbutter"
      category = "4"
      lot = "13"
      quantity = "500"
      description = "Disgusting protein source"
      price = "30"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Skippy peanutbutter"
      category = "4"
      lot = "13"
      quantity = "500"
      description = "Disgusting protein source"
      price = "45.50"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Skippy peanutbutter"
      category = "4"
      lot = "13"
      quantity = "500"
      description = "Disgusting protein source"
      price = "58"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Tostitos"
      category = "1"
      lot = "14"
      quantity = "500"
      description = "You can eat them with absolutely anything"
      price = "15"
      presentation = "1"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Tostitos"
      category = "1"
      lot = "14"
      quantity = "500"
      description = "You can eat them with absolutely anything"
      price = "20.50"
      presentation = "2"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)

      name = "Tostitos"
      category = "1"
      lot = "14"
      quantity = "500"
      description = "You can eat them with absolutely anything"
      price = "27.40"
      presentation = "3"
      Product.create!(name:name, category_id:category, lot_id:lot, quantity:quantity, description:description, price:price, presentation_id:presentation)
  end
end