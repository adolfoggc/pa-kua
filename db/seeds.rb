# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print 'Create Admin... '
if Member.all.count.zero?
  Member.create(email: 'fatima@pakua.com', password: 'pastel_na_quinta')
  print 'Done!'
end

puts ''
print 'Create Students... '
valid_cpfs = []
used_cpfs = Person.all.any? ? Person.all.map { |p| p.cpf } : [] 
while valid_cpfs.count < 8 do
  cpf = Faker::IDNumber.brazilian_citizen_number
  valid_cpfs << cpf unless ( valid_cpfs.include?(cpf)) || used_cpfs.include?(cpf)
end


unless Person.where(role: [1, 2, 3]).any?
  5.times do
    name = Faker::Name.name
    person = Person.new(  name: name,
                          birthdate: Date.new((1980..2010).to_a.sample, (1..12).to_a.sample, (1..28).to_a.sample),
                          cpf: valid_cpfs.sample,
                          school_level: Person.school_levels.keys.sample,
                          occupation: Faker::Job.title,
                          civil_status: Person.civil_statuses.keys.sample,
                          email: Faker::Internet.email(name: name),
                          cep: Faker::Address.zip_code,
                          address: Faker::Address.street_address,
                          phone: Faker::PhoneNumber.cell_phone,
                          start_date: Date.new(2021, 1, 1),
                          role: 1,
                          status: 'active',
                          marketing: Person.marketings.keys.sample
                        )
    valid_cpfs -= [person.cpf] if person.save
  end
  print 'Done!'
end

puts ''
print 'Tuition Fees... '
unless TuitionFee.all.any?
  { "0": 345, "1": 138, "2": 185, "3": 232, "4": 279, "5": 326 }.each do |k, v|
    TuitionFee.create(weekly_classes: k.to_s.to_i, fee: v, validity: Date.new(2021, 1, 1))
  end
  print 'Done!'
end

puts ''
print 'Rent... '
unless Rent.all.any?
  Rent.create(rental_amount: 35, starts_at: Date.new(2021, 1, 1))
  print 'Done!'
end

puts ''
print 'Create Discounts... '
if Discount.all.count.zero?
  { '1': 0, '3': 8, '6': 10, '12': 12 }.each do |k, v|
    Discount.create(discount_percentage: v, starts_at: Date.today, kind_of_plan: k.to_s.to_i)
  end
  print 'Done!'
end

puts ''
print 'Create Students... '



# puts ''
# print 'Create Modality... '
# if Modality.all.count.zero?
#   ['Yoga Chinês', 'Acrobacia', 'Armas de Corte', 'Arte Marcial', 'Arqueria', 'Tai Chi Pa-Kua', 'Ritmo'].each do |modality|
#     Modality.create(name: modality)
#   end
#   puts 'Done!'
# end

puts ''
puts 'Seed Complete'
