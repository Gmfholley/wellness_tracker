# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Intensity.find_or_create_by(name: "Low")
Intensity.find_or_create_by(name: "Medium")
Intensity.find_or_create_by(name: "High")
ExerciseUnit.find_or_create_by(name: "points")
ExerciseUnit.find_or_create_by(name: "calories")
ExerciseUnit.find_or_create_by(name: "miles")
ExerciseUnit.find_or_create_by(name: "kilometers")
ExerciseUnit.find_or_create_by(name: "steps")
ExerciseUnit.find_or_create_by(name: "minutes")