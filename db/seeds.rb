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

CategoriesPlace.delete_all
Place.delete_all
Category.delete_all
User.delete_all
Language.delete_all

french = Language.create!(
  name: 'Français',
  code: 'fr'
)
english = Language.create!(
  name: 'English',
  code: 'en'
)

jane = User.create!(
  pseudo: 'jane',
  email: 'jane.doe@gmail.com',
  password: 'janedoe',
  language: english
)
john = User.create!(
  pseudo: 'john',
  email: 'john.doe@outlook.fr',
  password: 'johndoe'
)
juju = User.create!(
  pseudo: 'juju',
  email: 'juju.doe@gmail.com',
  password: 'jujudoe',
  language: french
)

gastronomy = Category.create!(
  titles: {
    'en' => 'Gastronomy',
    'fr' => 'Gastronomie'
  },
  descriptions: {
    'en' => 'Places to honor your stomach...',
    'fr' => 'Des lieux pour honorer son estomac...'
  }
)
education = Category.create!(
  titles: {
    'en' => 'Education',
    'fr' => 'Culture'
  },
  descriptions: {
    'en' => 'Places to feed your brain...',
    'fr' => 'Des lieux pour nourrir son cerveau...'
  }
)
music = Category.create!(
  titles: {
    'en' => 'Music',
    'fr' => 'Musique'
  },
  descriptions: {
    'en' => 'When the music rings, rings, rings...',
    'fr' => 'Quand la musique sonne, sonne, sonne...'
  }
)
environment = Category.create!(
  titles: {
    'en' => 'Environment',
    'fr' => 'Environnement'
  },
  descriptions: {
    'en' => 'Places to breathe...',
    'fr' => 'Des lieux pour respirer...'
  }
)

baleinev = Place.create!(
  titles: {
    'en' => 'Baleinev Festival',
    'fr' => 'Festival Baleinev'
  },
  descriptions: {
    'en' => 'Baleinev is an open air festival managed by volunteers.',
    'fr' => 'Le Baleinev est un festival open air organisé par des bénévoles.'
  },
  price_chf: 30.00,
  duration_minutes: 500,
  schedules: {
    'en' => '24-25 April 2020 from 20h00 to 05h00',
    'fr' => '24 avril de 20h au 25 avril 2020 à 5h'
  },
  url: 'http://www.baleinev.ch/',
  geometry: RGeo::Geographic.spherical_factory(srid: 4326).point(6.659315, 46.779244),
  user: john,
  approved: true
)
champ_pittet = Place.create!(
  titles: {
    'en' => 'Champ-Pittet',
    'fr' => 'Champ-Pittet'
  },
  descriptions: {
    'en' => 'There is a natural reserve at Champ-Pittet.',
    'fr' => 'Champ-Pittet possède une réserve naturelle.'
  },
  price_chf: 0.00,
  duration_minutes: 120,
  schedules: {
    'en' => 'From Wednesday to Sunday from 10h00 to 17h30 (from 10 June 2020)',
    'fr' => 'Du mercredi au dimanche de 10h à 17h30 (dès le 10 juin 2020)'
  },
  geometry: RGeo::Geographic.spherical_factory(srid: 4326).point(6.665797, 46.783703),
  url: 'https://www.pronatura-champ-pittet.ch/fr',
  user: jane,
  approved: true
)
double_r = Place.create!(
  titles: {
    'en' => 'Double R',
    'fr' => 'Double R'
  },
  descriptions: {
    'en' => 'This restaurant offers American cuisine (burgers). Vegetarians are also welcome!',
    'fr' => 'Bar & grill à Yverdon-les-Bains, le Double R propose de la cuisine américaine, des hamburgers. Végétarien-ne-s également les bienvenu-e-s !'
  },
  price_chf: 25.00,
  duration_minutes: 90,
  schedules: {
    'en' => 'Opening hours: 09:00-23:00',
    'fr' => 'Heures d\'ouverture : 09:00-23:00'
  },
  geometry: RGeo::Geographic.spherical_factory(srid: 4326).point(6.637818, 46.780032),
  url: 'https://www.facebook.com/Le.Double.R/',
  user: jane,
  approved: true
)
echandole = Place.create!(
  titles: {
    'en' => 'The Echandole',
    'fr' => 'L\'Echandole'
  },
  descriptions: {
    'en' => 'The Echandole is a theater at Yverdon-les-Bains.',
    'fr' => 'L\'Echandole est une salle de spectacles à Yverdon-les-Bains.'
  },
  price_chf: 25.00,
  duration_minutes: 120,
  schedules: {
    'en' => 'Schedules depend on shows.',
    'fr' => 'Les horaires dépendent des spectacles.'
  },
  url: 'http://www.echandole.ch/',
  geometry: RGeo::Geographic.spherical_factory(srid: 4326).point(6.641681, 46.778430),
  user: juju
)
maison_ailleurs = Place.create!(
  titles: {
    'en' => 'Maison d\'Ailleurs',
    'fr' => 'La Maison d\'Ailleurs'
  },
  descriptions: {
    'en' => 'This museum of science fiction, utopia and extraordinary trips offers various exhibitions throughout the year.',
    'fr' => 'Ce musée de la science-fiction, de l\'utopie et des voyages extraordinaires propose diverses expositions tout au long de l\'année.'
  },
  price_chf: 12.00,
  duration_minutes: 120,
  schedules: {
    'en' => 'Mon.-Sun.: 11:00-18:00',
    'fr' => 'Ma-di : 11:00-18:00'
  },
  url: 'http://www.ailleurs.ch',
  geometry: RGeo::Geographic.spherical_factory(srid: 4326).point(6.641899, 46.778543),
  user: john,
  approved: true
)
numerik_games = Place.create!(
  titles: {
    'en' => 'Numerik Games Festival',
    'fr' => 'Festival Numerik Games'
  },
  descriptions: {
    'en' => 'The Numerik Games festival is related to digital art.',
    'fr' => 'Le festival Numerik Games est dédié à l\'art et la culture numériques.'
  },
  price_chf: 30.00,
  duration_minutes: 180,
  schedules: {
    'en' => '28-30 August 2020',
    'fr' => '28-30 août 2020'
  },
  url: 'https://www.numerik-games.ch',
  geometry: RGeo::Geographic.spherical_factory(srid: 4326).point(6.645001, 46.766403),
  user: juju,
  approved: true
)

CategoriesPlace.create!([{
                          place: double_r,
                          category: gastronomy
                        }, {
                          place: maison_ailleurs,
                          category: education
                        }, {
                          place: numerik_games,
                          category: music
                        }, {
                          place: numerik_games,
                          category: education
                        }, {
                          place: baleinev,
                          category: music
                        }, {
                          place: champ_pittet,
                          category: education
                        }, {
                          place: champ_pittet,
                          category: environment
                        }, {
                          place: echandole,
                          category: education
                        }])
