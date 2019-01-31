require_relative('../db/sql_runner')

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @genre = options['genre']
    @title = options['title']
    @budget = options['budget']
  end

  def save()
    sql = "INSERT INTO movies
    (
      title, genre, budget
    )
    VALUES
    (
      $1,$2,$3
    )
    RETURNING id"
    values = [@title,@genre,@budget]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end

  def update()

    sql = "UPDATE movies SET
    (
      title, genre, budget
    )
    =
    (
      $1,$2,$3
    )
    WHERE id = $4"
    values = [@title,@genre,@budget,@id]
    movie = SqlRunner.run( sql, values ).first

  end

  def stars()
    sql = "SELECT stars.* FROM stars
      INNER JOIN castings
      ON castings.star_id = stars.id
      WHERE movie_id = $1"
      values = [@id]
      stars = SqlRunner.run(sql,values)  #pull location from PG array-type object
      result = stars.map {|star| Star.new(star)}
      return result
  end

  def self.all()
    sql = "SELECT * FROM movies"
    values = []
    movies = SqlRunner.run(sql, values)
    result = movies.map { |movie| Movie.new( movie ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM movies WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql,values)
    movie_hash = results.first
    movie = Movie.new(movie_hash)
    return movie
  end



end
