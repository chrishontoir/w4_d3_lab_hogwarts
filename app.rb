require('sinatra')
require('sinatra/reloader') if development?
require('pry')
require_relative('./models/student.rb')
also_reload('./models/*')


get '/' do
  erb(:home)
end

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/:id' do
  @student = Student.find(params[:id])
erb(:show)
end
