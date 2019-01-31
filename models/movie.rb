require_relative('../db/sql_runner')

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @genre = options['genre']
    @title = options['title']
  end

  def save()
    sql = "INSERT INTO movies
    (
      title, genre
    )
    VALUES
    (
      $1,$2
    )
    RETURNING id"
    values = [@title,@genre]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end

  def update()
    
    sql = "UPDATE movies SET
    (
      title, genre
    )
    =
    (
      $1,$2
    )
    WHERE id = $3"
    values = [@title,@genre,@id]
    movie = SqlRunner.run( sql, values ).first

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
  # def locations()
  #   sql = "SELECT locations.*
  #   from locations
  #   INNER JOIN visits ON visits.location_id = locations.id
  #   WHERE visits.movie_id = $1
  #   "
  #   values = [@id]
  #   locations = SqlRunner.run(sql,values)  #pull location from PG array-type object
  #   results = locations.map {|location| Location.new(location)}
  #   return results
  # end


end
