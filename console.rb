require('pry')
require_relative('models/casting.rb')
require_relative('models/movie.rb')
require_relative('models/star.rb')

Movie.delete_all()
Star.delete_all()


movie_1 = Movie.new({
  'title' => 'One Flew Over The Cuckoos Nest',
  'genre' => 'Comedy',
  'budget' => 20 })

movie_2 = Movie.new({
  'title' => 'Spiderman',
  'genre' => 'Action',
  'budget' => 30 })

movie_1.save()

movie_2.save()

star_1 = Star.new({
  'first_name' => 'Jack',
  'last_name' => 'Nicholson'})

star_2 = Star.new({
  'first_name' => 'Bob',
  'last_name' => 'Ross'})

star_1.save()

star_2.save()

casting_1 = Casting.new({
  'movie_id' => movie_1.id,
  'star_id' => star_1.id,
  'fee' => 2})

casting_2 = Casting.new({
  'movie_id' => movie_2.id,
  'star_id' => star_2.id,
  'fee' => 5})

casting_2 = Casting.new({
  'movie_id' => movie_2.id,
  'star_id' => star_2.id,
  'fee' => 6})

casting_1.save

binding.pry
nil
