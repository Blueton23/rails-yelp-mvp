require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

10.times do
  restaurant = Restaurant.create!({ name: Faker::Restaurant.name, address: Faker::Address.full_address,
                                    phone_number: Faker::PhoneNumber.cell_phone,
                                    category: %w[chinese italian japanese french belgian].sample })
  puts "Created #{restaurant.name}"
end

50.times do
  Review.create!({ content: Faker::Lorem.sentence, rating: Faker::Number.within(range: 0..5),
                   restaurant_id: Restaurant.all.sample.id })
end
puts 'Finished!'
