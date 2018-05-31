require_relative("../db/sql_runner")

class Star

  attr_reader :id
  attr_accessor :first_name, :last_names

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO stars
    (name) VALUES
    ($1, $2)
    RETURNING id"
    values = [@first_name, @last_name]
    user = SqlRunner.run( sql, values ).first
    @id = user['id'].to_i
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

end
