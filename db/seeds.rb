require 'faker'
require 'populator'

Contact.delete_all
Category.delete_all
Tag.delete_all

Category.populate(10) do |cat|
  cat.name = Faker::Lorem.sentence(1)
end

Tag.populate(20) do |tag|
  tag.name = Faker::Lorem.words(1)[0]
end

Contact.populate(200) do |contact|
  contact.user_id = 1
  contact.first_name = Faker::Name.first_name
  contact.surname = Faker::Name.last_name
  contact.phone = Faker::PhoneNumber.phone_number    
  contact.email = Faker::Internet.email
  contact.homepage = Faker::Internet.domain_name
  contact.city = Faker::Address.city
  contact.street = Faker::Address.street_name
  contact.post_code = Faker::Address.zip_code
  contact.category_id = Category.all[rand(Category.all.size)].id
end

Contact.all.each do |c|
  2.times do
    c.tags << Tag.all[rand(Tag.all.size)]
  end
end
