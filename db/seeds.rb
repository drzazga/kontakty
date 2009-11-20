require 'faker'

Contact.delete_all
Category.delete_all
Tag.delete_all

1.upto(10) do
  Category.create(
    :name => Faker::Lorem.sentence(1)
  )
end

1.upto(10) do
  Tag.create(
    :name => Faker::Lorem.words(1)[0]
  )
end

1.upto(100) do 
  Contact.create(
    :user_id => 1,
    :first_name => Faker::Name.first_name,
    :surname => Faker::Name.last_name,
    :phone => Faker::PhoneNumber.phone_number,
    :email => Faker::Internet.email,
    :homepage => Faker::Internet.domain_name,
    :city => Faker::Address.city,
    :street => Faker::Address.street_name,
    :post_code => Faker::Address.zip_code,
    :category_id => Category.all[rand(10)].id
  ) 
end 
