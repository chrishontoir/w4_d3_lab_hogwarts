require_relative("../db/sql_runner")

class House

attr_reader :name, :id

def initialize(options)
  @name = options['name']
  @id = options['id'] if options['id']
end

def save
  sql = "INSERT INTO houses (name)
    VALUES ($1)
    RETURNING id"
  values = [@name]
  house = SqlRunner.run(sql, values)
  @id = house.first()['id'].to_i
end

def self.delete_all
  sql = "DELETE FROM houses"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM houses"
  houses = SqlRunner.run(sql)
  return houses.map {|house| House.new(house)}
end

def self.find(id)
  sql = "SELECT * FROM houses WHERE id = $1"
  values = [id]
  house = SqlRunner.run(sql, values).first
  return House.new(house)
end


end
