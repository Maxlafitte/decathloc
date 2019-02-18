# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

equipments = Equipment.create([{title: 'Riedell R3',
                                size: '41',
                                description: 'Ready to roll!',
                                shape: 'Good',
                                location: 'Paris',
                                daily_price: '10'},
                                {title: 'Antik AR-1 Phantom Shade ',
                                  size: '37',
                                  description: 'Nice and good for your ankles',
                                  shape: 'Average',
                                  location: 'London',
                                  daily_price: '18'}])
