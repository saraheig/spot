# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  AdminUser.delete_all
  AdminUser.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  )
end

PlacesCategory.delete_all
Place.delete_all
Category.delete_all

double_r = Place.create!(
  title: 'Le Double R',
  description: 'Bar & grill à Yverdon-les-Bains, le Double R propose de la cuisine américaine, des hamburgers. Végétarien-ne-s également les bienvenu-e-s !',
  price: 25.00,
  duration: 90,
  schedule: 'Heures d\'ouverture : 09:00-23:00',
  lat: 46.779951,
  lng: 6.637833
)
maison_ailleurs = Place.create!(
  title: 'La Maison d\'Ailleurs',
  description: 'Ce musée de la science-fiction, de l\'utopie et des voyages extraordinaires propose diverses expositions tout au lond de l\'année.',
  price: 12.00,
  duration: 120,
  schedule: 'Ma-di : 11:00-18:00',
  lat: 46.778594,
  lng: 6.641896
)
numerik_games = Place.create!(
  title: 'Numerik Games Festival',
  description: 'Le Numerik Games Festival est dédié à l\'art et la culture numériques.',
  price: 30.00,
  duration: 180,
  schedule: 'Dates pour 2019 : 30 août au 1er septembre',
  lat: 46.766403,
  lng: 6.645001
)

gastronomie = Category.create!(
  title: 'Gastronomie',
  description: 'Des lieux pour honorer son estomac...'
)
culture = Category.create!(
  title: 'Culture',
  description: 'Des lieux pour nourrir son cerveau...'
)
musique = Category.create!(
  title: 'Musique',
  description: 'Quand la musique sonne, sonne, sonne...'
)

PlacesCategory.create!([{
                         place: double_r,
                         category: gastronomie
                       }, {
                         place: maison_ailleurs,
                         category: culture
                       }, {
                         place: numerik_games,
                         category: musique
                       }, {
                         place: numerik_games,
                         category: culture
                       }])
