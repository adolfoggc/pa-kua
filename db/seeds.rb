# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

{ '1': 0, '3': 8, '6': 10, '12': 12 }.each do |k, v|
  Discount.create(discount_percentage: v, starts_at: Date.today, kind_of_plan: k.to_s.to_i)
end