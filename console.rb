require_relative( 'models/star' )
require_relative( 'models/movie' )
require_relative( 'models/casting' )

require('pry')

Star.delete_all()
Movie.delete_all()
Casting.delete_all()

star1 = Star.new({ 'first_name' => 'Humphrey','last_name' => 'Bogart'})
star1.save()
star2 = Star.new({ 'first_name' => 'Cary','last_name' => 'Grant'})
star2.save()
star3 = Star.new({ 'first_name' => 'Lawrence','last_name' => 'Olivier'})
star3.save()

movie1 = Movie.new({ 'title' => 'Rebecca', 'genre' => 'Thriller', 'rating' => 4})
movie1.save()
movie2 = Movie.new({ 'title' => 'Casablanca', 'genre' => 'Drama', 'rating' => 5})
movie2.save()
movie3 = Movie.new({ 'title' => 'Gone With the Wind', 'genre' => 'Epic', 'rating' => 3})
movie3.save()

casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => '300'})
casting1.save()
casting2 = Casting.new({ 'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => '200'})
casting2.save()
casting3 = Casting.new({ 'movie_id' => movie3.id, 'star_id' => star3.id, 'fee' => '100'})
casting3.save()

stars = Star.all()

star1.first_name = "Bob"
star1.last_name = "Burger"
star1.update()

updated_stars = Star.all()


movies = Movie.all()

movie1.title = "Spoons"
movie1.update()

casting1.fee = '888'
casting1.update()

binding.pry
nil
