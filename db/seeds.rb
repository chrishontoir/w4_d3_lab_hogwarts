require_relative ('../models/student.rb')
require_relative('../models/house.rb')
require('pry')

Student.delete_all
House.delete_all

house1 = House.new({
  "name" => "Gryffindor"
})

house2 = House.new({
  "name" => "Slytherin"
})

house3 = House.new({
  "name" => "Hufflepuff"
})

house4 = House.new({
  "name" => "Ravenclaw"
})

house1.save
house2.save
house3.save
house4.save

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 11
  })

student1.save

student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => house1.id,
  "age" => 11
  })

student2.save

binding.pry
nil
