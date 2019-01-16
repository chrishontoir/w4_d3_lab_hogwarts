require_relative('../db/sql_runner')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id']
    @age = options['age'].to_i
  end

  def save
    sql = "INSERT INTO students (first_name, last_name, house_id, age)
      VALUES ($1, $2, $3, $4)
      RETURNING id"
    values = [@first_name, @last_name, @house_id, @age]
    student = SqlRunner.run(sql, values)
    @id = student.first()['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map {|student| Student.new(student)}
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values).first
    return Student.new(student)
  end

  def house()
    sql = "SELECT houses.name FROM houses INNER JOIN students ON students.house_id = houses.id WHERE students.id = $1"
    values = [@id]
    house = SqlRunner.run(sql, values).first
    return House.new(house)
  end

end
