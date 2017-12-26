# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


p "erasing everything"
User.delete_all
Coach.delete_all
Player.delete_all
Menage.delete_all
Parent.delete_all
CoachFunction.delete_all
Team.delete_all

p "creating 20 users 1/5 are parents - 1 is a coach - 1 is an admin - 1 is coach player parent and admin"
counter = 0
20.times do
  counter += 1
  params = {}
  params[:email] = "user#{counter}@user"
  params[:password] = "password"
  params[:f_name] = "user#{counter}"
  params[:l_name] = "#{counter}user"
  params[:dob] = Faker::Date.birthday(5, 65)
  params[:phone] = "45612315"
  if counter == 20
    params[:is_admin] = true
    params[:is_coach] = true
    params[:is_player] = true
    params[:is_parent] = true
    User.create(params)
  elsif counter % 5 == 0
    params[:is_parent] = true
    params[:is_player] = false
    User.create(params)
  elsif counter == 19
    params[:is_admin] = true
    params[:is_player] = false
    User.create(params)
  elsif counter == 18
    params[:is_coach] = true
    params[:is_player] = false
    User.create(params)
  else
    params[:is_player] = true
    User.create(params)
  end
end

p "created #{counter} users"

p User.all

p Coach.all

p "creating coaching staff"

first_coach = Coach.first
second_coach = Coach.last

assistant = CoachFunction.create(coach_role: "assistant")
head_coach = CoachFunction.create(coach_role: "head coach")

first_coach.coach_function_id = assistant.id
second_coach.coach_function_id = head_coach.id
first_coach.save
second_coach.save

p "creating team"

team = Team.new(name: "Test Team")
team.save!

p "assign coaches to teams"

CoachFunction.all.each do |coach|
  coach.team_id = team.id
  coach.save
end

p "conecting players to team"
counter = 1
Player.all.each do |player|
  player.team_id = team.id
  player.number = counter
  counter += 1
  player.save!
end



