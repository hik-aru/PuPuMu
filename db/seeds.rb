# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'
  ProgramLang.create([
    { :name => "C" },
    { :name => "C#" },
    { :name => "C++" },
    { :name => "Java" },
    { :name => "JavaScript" },
    { :name => "Ruby" },
    { :name => "PHP" },
    { :name => "Python" },
    { :name => "Go" },
    { :name => "Scala" },
    { :name => "Kotlin" },
    { :name => "Swift" }
  ])
end