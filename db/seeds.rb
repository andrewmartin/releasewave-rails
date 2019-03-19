# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating admin users"
[
  'hello@andrewmart.in',
].each do |email|
  User.find_or_create_by!(email: email) do | user |
    user.password = ENV['ADMIN_PASSWORD']
    user.is_admin = true
  end
end

15.times do
  r = Release.new({name: Faker::Music.album})
  r.save!
  a = Artist.new({name: Faker::Music.album})
  a.save!
  r.artist_releases.create(artist_id: a.id)
end