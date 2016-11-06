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
  { email: 'sebastian@example.com', password: 'password' },
  { email: 'jedrzej@example.com', password: 'password', password_confirmation: 'password' },
  { email: 'doctor@example.com', password: 'password', password_confirmation: 'password' },
  { email: 'patient@example.com', password: 'password', password_confirmation: 'password' }

])

Receipt.destroy_all

