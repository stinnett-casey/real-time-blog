# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@casey = User.create first_name: 'Casey', last_name: 'Stinnett', email: 'stinnett.casey@gmail.com', password: 'password', password_confirmation: 'password'
@chelsea = User.create first_name: 'Chelsea', last_name: 'Stinnett', email: 'stinnett.chelsea@gmail.com', password: 'password', password_confirmation: 'password'
@thomas = User.create first_name: 'Thomas', last_name: 'Stinnett', email: 'stinnett.thomas@gmail.com', password: 'password', password_confirmation: 'password'
@kajsa = User.create first_name: 'Kajsa', last_name: 'Stinnett', email: 'stinnett.kajsa@gmail.com', password: 'password', password_confirmation: 'password'
@magnus = User.create first_name: 'Magnus', last_name: 'Stinnett', email: 'stinnett.magnus@gmail.com', password: 'password', password_confirmation: 'password'

@casey.posts.create [
  {content: 'casey first post'},
  {content: 'casey second post'},
  {content: 'casey third post'}
]

@chelsea.posts.create [
  {content: 'chelsea first post'},
  {content: 'chelsea second post'},
  {content: 'chelsea third post'}
]

@thomas.posts.create [
  {content: 'thomas first post'},
  {content: 'thomas second post'},
  {content: 'thomas third post'}
]

@kajsa.posts.create [
  {content: 'kajsa first post'},
  {content: 'kajsa second post'},
  {content: 'kajsa third post'}
]

@magnus.posts.create [
  {content: 'magnus first post'},
  {content: 'magnus second post'},
  {content: 'magnus third post'}
]