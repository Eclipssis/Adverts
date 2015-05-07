# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do |i|
  country = Country.create title: "Country ##{i + 1}"
  5.times do |y|
    country.cities.create(title: "City #{y + 1} in #{i + 1} country")
  end
end

Role.create(name: "admin")
Role.create(name: "moderator")
Role.create(name: "user")

user = User.create(
    fio:                   "Some FIO",
    login:                 "Eclipssis",
    birthday:              "10.12.1992",
    country:               "Ukraine",
    city:                  "Sumy",
    email:                 "admin@yandex.ru",
    password:              "12345678",
    password_confirmation: "12345678"
)

user.skip_confirmation!
user.save!

30.times do |advert|
  user.adverts.create(title: "Заголовок #{advert + 1}-го Обьявления" , text: "Nullam tempor, eros at maximus commodo, tortor arcu viverra justo, a tincidunt ligula orci at metus. Suspendisse eu porta ipsum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce semper non erat in rutrum. Nam vestibulum quis nisi sit amet lobortis. Donec est dui, aliquet sit amet lorem vel, varius viverra magna. Mauris eget commodo lacus. Ut quis risus massa.")
  5.times { |comment| user.comments.create(text: "#{user.login} comment #{comment + 1}", advert_id: advert + 1) }
end

