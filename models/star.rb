require_relative('../db/sql_runner')

class Star

  attr_reader :id
  attr_accessor :last_name, :first_name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO stars
    (
      first_name, last_name
    )
    VALUES
    (
      $1,$2
    )
    RETURNING id"
    values = [@first_name,@last_name]
    star = SqlRunner.run( sql, values ).first
    @id = star['id'].to_i
  end

  def update()

    sql = "UPDATE stars SET
    (
      first_name, last_name
    )
    =
    (
      $1,$2
    )
    WHERE id = $3"
    values = [@first_name,@last_name,@id]
    star = SqlRunner.run( sql, values ).first

  end

  def self.all()
    sql = "SELECT * FROM stars"
    values = []
    stars = SqlRunner.run(sql, values)
    result = stars.map { |star| Star.new( star ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM stars WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql,values)
    star_hash = results.first
    star = Star.new(star_hash)
    return star
  end
  # def locations()
  #   sql = "SELECT locations.*
  #   from locations
  #   INNER JOIN visits ON visits.location_id = locations.id
  #   WHERE visits.Star_id = $1
  #   "
  #   values = [@id]
  #   locations = SqlRunner.run(sql,values)  #pull location from PG array-type object
  #   results = locations.map {|location| Location.new(location)}
  #   return results
  # end


end
