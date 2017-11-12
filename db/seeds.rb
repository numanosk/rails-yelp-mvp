
12.times do
  restaurant = Restaurant.new(
    name: Faker::DragonBall.character,
    address: Faker::Address.street_address + " " + Faker::Address.city ,
    category: Restaurant::CATEGORIES.sample,
    phone_number: Faker::PhoneNumber.cell_phone
    )
  restaurant.save!
end
