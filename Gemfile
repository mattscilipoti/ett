source 'https://rubygems.org'

ruby '2.3.1'

# The 3 main gems: rails, db, app server
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'sqlite3' # Use sqlite3 as the database for Active Record
gem 'puma', '~> 3.0' # Use Puma as the app server

# The rest are sorted alphabetically
# gem 'bcrypt', '~> 3.1.7' # Use ActiveModel has_secure_password
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'haml-rails' # compact view templates
gem 'jbuilder', '~> 2.5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails' # Use jquery as the JavaScript library
# gem 'redis', '~> 3.0' # Use Redis adapter to run Action Cable in production
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets


group :development, :test do
  gem 'accept_values_for' # Rspec matchers to test ActiveModel validation that follows BDD.
  gem 'database_cleaner', require: false
  gem 'guard-rspec'
  gem 'rspec-rails'
  # Call 'byebug' or `binding.pry` anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console' # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
