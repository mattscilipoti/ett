# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

r = Report.with_start_time
t = Task.create!(name: 'TEST TASK')
t.occurrences.create!(started_at: r.started_at)
t.occurrences.create!(started_at: r.started_at + 10.minutes)
t.occurrences.create!(started_at: r.started_at + 1.hour)
