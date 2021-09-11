# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
#   email: 'admin@mail.com',
#   password: 'test123456'
# )

 User.create!(
     email: 'user@mail.com',
     password: '123456',
     name: '試作品１号',
     user_status: 'true',
     code: '123456789',
     introduction: 'よろしくおねがいします',
     genre_id: '1'
     )
     
 User.create!(
     email: 'user2@mail.com',
     password: '123456',
     name: '試作品２号',
     user_status: 'false',
     code: '123456789',
     introduction: 'よろしくおねがいします',
     genre_id: '1'
     )