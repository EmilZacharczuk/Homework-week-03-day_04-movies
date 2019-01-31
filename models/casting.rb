require_relative('../db/sql_runner')

class Casting

  attr_reader :id
  attr_accessor :movie_id, :star_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
  end

  def save()
    sql = "INSERT INTO castings
    (
      movie_id, star_id
    )
    VALUES
    (
      $1,$2
    )
    RETURNING id"
    values = [@movie_id,@star_id]
    star = SqlRunner.run( sql, values ).first
    @id = star['id'].to_i
  end

  # def update()
  #
  #   sql = "UPDATE stars SET
  #   (
  #     first_name, last_name
  #   )
  #   =
  #   (
  #     $1,$2
  #   )
  #   WHERE id = $3"
  #   values = [@first_name,@last_name,@id]
  #   star = SqlRunner.run( sql, values ).first
  #
  # end

  def self.all()
    sql = "SELECT * FROM castings"
    values = []
    castings = SqlRunner.run(sql, values)
    result = castings.map { |casting| Casting.new( casting ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM castings WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql,values)
    casting_hash = results.first
    casting = Casting.new(casting_hash)
    return casting
  end
end
