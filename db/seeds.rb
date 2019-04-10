# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.delete_all
Place.delete_all

AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
) if Rails.env.development?

Place.create!([{
  title: 'Le Double R',
  description: 'Bar & grill à Yverdon-les-Bains, le Double R propose de la cuisine américaine, des hamburgers. Végétarien-ne-s également les bienvenu-e-s !',
  price: 25.00,
  duration: 90,
  schedule: 'Heures d\'ouverture : 09:00-23:00',
  lat: 46.779951,
  lng: 6.637833
},{
  title: 'La Maison d\'Ailleurs',
  description: 'Ce musée de la science-fiction, de l\'utopie et des voyages extraordinaires propose diverses expositions tout au lond de l\'année.',
  price: 12.00,
  duration: 120,
  schedule: 'Ma-di : 11:00-18:00',
  lat: 46.778594,
  lng: 6.641896
},{
  title: 'Numerik Games Festival',
  description: 'Le Numerik Games Festival est dédié à l\'art et la culture numériques.',
  price: 30.00,
  duration: 180,
  schedule: 'Dates pour 2019 : 30 août au 1er septembre',
  lat: 46.766403,
  lng: 6.645001
},])
