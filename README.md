# Spot

The main aim of this project is to list and map spots (places of interest and activities) of a region, such as the city of [Yverdon-les-Bains][yverdon] (Switzerland).

This project is composed by a [Ruby on Rails][rails] 6.0+ application with **a responsive mobile part** and **an administration Web part**.

The application is currently deployed on [Heroku][heroku-main]. To access the administration Web part, please use the following [link][heroku-admin]. The application is tested through unit and system tests with [Travis CI][travis] to run the tests and [Coveralls][coveralls] to check the coverage of the tests.

- [Main characteristics](#main-characteristics)
- [Requirements](#requirements)


## Main characteristics

Here are the main characteristics of the application:
* The [administration Web part of the application][heroku-admin] allows to manage [spots][heroku-spots], [categories of spots][heroku-categories], [lambda users][heroku-lambda-users] and [admin users][heroku-admin-users]. The administration Web part of the application was developed with [Active Admin][active-admin].
* The non-administration Web part of the application was developed to be responsive with [Bulma][bulma]. This part has several functionalities:
  * Spots can be previewed through a [list][heroku-main] with images that are stored on [Amazon S3][amazon] and a [Leaflet][leaflet] [map][heroku-map]. Moreover, it is possible to select spots of a specific category, such as the [gastronomy category][heroku-gastronomy] and to read more details about a specific spot by selecting it in the [list][heroku-main] or in the [map][heroku-map].
  * Anybody has the possibility to [create a user account][heroku-registration] with a pseudo, email and password and [login][heroku-login] in order to suggest new places of interest and activities through a [form][heroku-suggestion].
* The application is entirely [multilingual][heroku-language] (interfaces and database). Currently two languages are proposed: English (default language) and French.


## Requirements

* [Ruby][ruby] 2.6.5
* [PostgreSQL][postgresql] 12.2+
  * [PostGIS][postgis] 3.0+
* [Yarn][yarn] 1.22+
* [Git][git] to access and manage the code
* [Chrome][chrome] to run system tests

Tip: Use [rbenv][rbenv] or [RVM][rvm] with [Ubuntu][ubuntu] for instance.

Here are the main steps to quickly set up the machine in order to locally run this application:
1. Install [Ruby][ruby] with [ruby-build][ruby-build] for instance, [PostgreSQL][postgresql], [PostGIS][postgis], [Yarn][yarn], [Git][git] and [Chrome][chrome]
2. Download the code from this page or by the command line `git clone https://github.com/saraheig/spot.git`
3. Install the dependencies with [Yarn][yarn] with `cd spot` and then `yarn install`
4. Install bundler with `gem install bundler:2.1.4`
5. Install the [Ruby gems][ruby-gems] with `bundle install`
6. Start PostgreSQL with `sudo service postgresql start`
7. Create the database with `rails db:create` (If necessary, create a user with `sudo -u postgres createuser --superuser YourName`)
8. Connect to the database **spot_development** and enable PostGIS with `psql -d spot_development` and then `CREATE EXTENSION postgis;`
9. Migrate the database with `rails db:migrate`
10. Populate the database with `rails db:seed`
11. Launch the application with `rails server` and open a browser at [https://localhost:3000][localhost] for instance

Furthermore:
* To locally execute the tests, run `rails test` and `rails test:system`.
* To write or modify code, the [Atom][atom] text editor can for instance be used.
* To access to the local database, run `rails console`.


**June 2020 / [MAS-RAD formation][mas-rad]**


[active-admin]: https://activeadmin.info
[amazon]: https://aws.amazon.com/s3
[atom]: https://atom.io
[bulma]: https://bulma.io
[chrome]: https://www.google.com/chrome
[coveralls]: https://coveralls.io
[ruby-gems]: https://rubygems.org
[git]: https://git-scm.com
[heroku-admin]: https://yverdon.herokuapp.com/admin
[heroku-admin-users]: https://yverdon.herokuapp.com/admin/admin_users
[heroku-categories]: https://yverdon.herokuapp.com/admin/categories
[heroku-gastronomy]: https://yverdon.herokuapp.com/places/gastronomy
[heroku-lambda-users]: https://yverdon.herokuapp.com/admin/users
[heroku-language]: https://yverdon.herokuapp.com/languages/new
[heroku-login]: https://yverdon.herokuapp.com/session/new
[heroku-main]: https://yverdon.herokuapp.com
[heroku-map]: https://yverdon.herokuapp.com/places/map
[heroku-registration]: https://yverdon.herokuapp.com/users/new
[heroku-spots]: https://yverdon.herokuapp.com/admin/places
[heroku-suggestion]: https://yverdon.herokuapp.com/places/new
[leaflet]: https://leafletjs.com
[localhost]: https://localhost:3000
[mas-rad]: https://www.he-arc.ch/ingenierie/mas-rad
[postgis]: https://postgis.net
[postgresql]: https://www.postgresql.org
[rails]: https://rubyonrails.org
[rbenv]:https://github.com/rbenv/rbenv
[ruby]: https://www.ruby-lang.org
[ruby-build]: https://github.com/rbenv/ruby-build
[rvm]: http://rvm.io
[travis]: https://travis-ci.org
[ubuntu]: https://ubuntu.com
[webpack]: https://webpack.js.org
[yarn]: https://yarnpkg.com
[yverdon]: http://www.yverdon-les-bains.ch
