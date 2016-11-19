# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
current_time = Time.now
User.destroy_all
User.create([
  {
    first_name: 'Sebastian',
    last_name: 'Wilgosz',
    email: 'sebastian@example.com',
    password: 'password',
    pesel: 12345678999,
    role: 'patient'
  },

  {
    first_name: 'Jędrzej',
    last_name: 'Janaś',
    email: 'jedrzej@example.com',
    password: 'password',
    password_confirmation: 'password',
    pesel: 12345678900,
    role: 'patient'
  },

  {
    first_name: 'Gregory',
    last_name: 'House',
    email: 'doctor@example.com',
    password: 'password',
    password_confirmation: 'password',
    pesel: 12345678901,
    role: 'doctor'
  },

  {
    first_name: 'Sample',
    last_name: 'Pharmacist',
    email: 'pharmacist@example.com',
    password: 'password',
    password_confirmation: 'password',
    pesel: 12345678902,
    role: 'pharmacist'
  }
])

Receipt.destroy_all

