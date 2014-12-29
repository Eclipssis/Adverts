# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do |i|
  country = Country.create title: "Country ##{i+1}"
  5.times do |y|
    country.cities.create(title: "City #{y+1} in #{i+1} country")
  end
end




