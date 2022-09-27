# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating admin users"
[
  "hello@andrewmart.in",
].each do |email|
  User.find_or_create_by!(email: email) do |user|
    user.password = ENV["ADMIN_PASSWORD"]
    user.is_admin = true
  end
end

Release.destroy_all
Artist.destroy_all

50.times do
  r = Release.new({
    name: Faker::Music.unique.album,
    description: "<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi, eius accusamus minima quos perspiciatis at sed, illum dolorum delectus ut eaque tempora nesciunt maxime sint totam maiores aliquid placeat harum!</p>",
    buy: "#",
    release_date: Faker::Date.forward([*5..95].sample),
    featured: [true, false].sample,
  })

  r.save!

  embed = '<iframe width="560" height="315" src="https://www.youtube.com/embed/m-ivNAPbHTQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
  r.embeds.create!(content: embed)

  r.save!

  a = Artist.new({
    name: Faker::Music.unique.band,
    facebook: "#",
    spotify: "#",
    soundcloud: "#",
    website: "#",
    youtube: "#",
    itunes: "#",
    twitter: "#",
    instagram: "#",
  })
  a.save!
  r.artist_releases.create(artist_id: a.id)

  puts "created release for #{r.release_date} named #{r.name}"
end
