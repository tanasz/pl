require 'faker'

puts "-"*30
# ménage
Attendance.destroy_all
Training.destroy_all
Membership.destroy_all
User.destroy_all
puts "Existing data cleaned up!"

users = Array.new
50.times do
  u = User.new
  u.last_name  = Faker::Name.last_name.upcase
  u.first_name = Faker::Name.first_name.capitalize
  u.email = Faker::Internet.email
  u.password = 'totototo'
  u.date_of_birth = Faker::Date.between(60.years.ago, 18.years.ago)
  u.birthplace_city = Faker::GameOfThrones.city
  u.birthplace_postcode = "FR" + rand(00100..93500).to_s
  u.birthplace_country = 'FRANCE'
  u.board_member = rand(0..100) < 10 ? true : false
  u.teacher = rand(0..100) < 20 ? true : false
  u.gender = ['female', 'female', 'female' , 'trans', 'male', 'male', 'male', 'male', 'male', 'male', '?'].sample
  u.mobile_phone = Faker::PhoneNumber.phone_number
  u.emergency_contact_name = Faker::Superhero.name
  u.emergency_contact_phone = Faker::PhoneNumber.phone_number
  u.emergency_contact_relationship = ['father','mother','friend','husband','wife','daughter'].sample
  u.photo = Faker::Placeholdit.image("120x150", 'jpg', 'ffffff', '000')
  u.address = Faker::Address.street_address
  u.postcode = Faker::Address.postcode
  u.city = Faker::GameOfThrones.city
  u.country = Faker::Address.country
  u.save
  users << u
end
puts "- #{users.count} users seeded!"

memberships = Array.new
100.times do
  m = Membership.new
  m.period = ['2015', '2016', '2017', '2018', '2014'].sample
  m.membership_type = ['standard_membership', 'student_membership', 'reduced_membership'].sample
  m.fee = ['180', '210', '85'].sample
  m.fee_is_paid = [true, false].sample
  m.application_ok = [true, false].sample
  m.medical_certificate_ok = [true, false].sample
  m.commentary = Faker::Hipster.paragraph(1, true, 1)
  m.status = ['membership_ok', 'membership_waiting', 'membership_revoked'].sample
  m.license_number = rand(1000..8000)
  m.club_number = rand(100..1000)
  m.user = users.sample
  m.save
  memberships << m
end
puts "- #{memberships.count} memberships seeded!"

trainings     = Array.new
debut         = '02 Sep 2013 18:00:00'.to_datetime
i             = 1
board_members = User.board_members
#puts board_members
teachers      = User.teachers
500.times do
  i += 3
  t = Training.new
  t.date_time = debut + i.days
  t.duration = ['1', '1:30', '2'].sample # en heures ?
  t.theme = ['wrestling', 'yoga', 'running', 'ppg'].sample
  t.location = ['tour_des_dames_dojo','tour_des_dames_fitness', 'autre_endroit'].sample
  t.board_members = [board_members.sample, board_members.sample]
  t.teachers = [teachers.sample, teachers.sample]
  t.save
  trainings << t
end
puts "- #{trainings.count} trainings seeded!"

attendances = Array.new
1000.times do
  a = Attendance.new
  a.commentary = rand(1..100) < 10 ? Faker::Hipster.sentence(5) : nil
  a.incident = rand(1..100) < 5 ? true : nil
  a.incident_type = a.incident ? ['wound', 'fainting', 'death'].sample : nil
  a.user = users.sample
  a.training = trainings.sample
  a.save
  attendances << a
end
puts "- #{attendances.count} attendances seeded!"

puts "Seed is done."
puts "-"*30
