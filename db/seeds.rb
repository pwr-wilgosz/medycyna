# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
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
Receipt.create([
  {
    user: User.find_by(email: 'sebastian@example.com'),
    doctor: User.find_by(email: 'doctor@example.com'),
    line_items: LineItem.create([
      {
        name: 'Apap', amount: 1, refunded: 100,
        usage: '5 x 1 portion, and always when you got a headache'
      },
      {
        name: 'Ibuprom', amount: 1, refunded: 0,
        usage: '5 x 1 portion, when apap does not help'
      },
      {
        name: 'Ketanol', amount: 1, refunded: 100,
        usage: 'Take until you stop feeling the pain'
      }
    ])
  },
  {
    user: User.find_by(email: 'sebastian@example.com'),
    doctor: User.find_by(email: 'doctor@example.com'),
    line_items: LineItem.create([
      {
        name: 'Alvesco', amount: 1, refunded: 50,
        usage: '1x1 portion per day'
      },
      {
        name: 'Jovesto', amount: 2, refunded: 0,
        usage: '2 x 1 portion, for 7 days'
      },
      {
        name: 'Zinnac', amount: 1, refunded: 100,
        usage: '1portion/12h for 5 days'
      }
    ])
  },
  {
    user: User.find_by(email: 'jedrzej@example.com'),
    doctor: User.find_by(email: 'doctor@example.com'),
    line_items: LineItem.create([
      {
        name: 'Vigantol', amount: 1, refunded: 50,
        usage: '1x1 portion per day'
      },
      {
        name: 'Singular', amount: 2, refunded: 0,
        usage: '2 x 1 portion'
      }
    ])
  }
])

