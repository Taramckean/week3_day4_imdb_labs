require_relative("../db/sql_runner")

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :rating

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @rating = options['rating']
  end

  def save()
    sql = "INSERT INTO movies
    (title, genre, rating)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre,@rating]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM movies"
    values = []
    movies = SqlRunner.run(sql, values)
    result = movies.map { |movie| Movie.new(movie) }
    return result
  end

  def update()
    sql = "UPDATE movies SET (title, genre, rating) =
      ($1, $2, $3) WHERE id = $4"
      values = [@title, @genre, @rating, @id]
      SqlRunner.run(sql, values)
    end

    def star()
      sql = "SELECT * from stars INNER JOIN movies ON movies.id = stars.id
      WHERE movies.id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      results.map {|result| Star.new(result)}
    end


  def self.delete_all()
    sql = "DELETE FROM movies"
    values = []
    SqlRunner.run(sql, values)
  end

end
