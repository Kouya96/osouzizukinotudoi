# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create( last_name:'木村', first_name:'公哉', last_name_kana:'キムラ', first_name_kana:'コウヤ', email:'aa@aa', password:'000000' )

Genre.create([
  { name: 'キッチン' },
  { name: 'リビング' },
  { name: 'トイレ' },
  { name: 'お風呂' },
])