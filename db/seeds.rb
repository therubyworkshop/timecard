# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

{
  "Google"    => 123.45,
  "Apple"     => 999.99,
  "Microsoft" => 555
}.each do |name, rate|
  card = Card.where(name: name).first_or_create!({rate: rate}, without_protection: true)
  %w(LP SJ BG).each do |initials|
    Stamp.where(card_id: card.id, initials: initials).first_or_create!({
        duration:     rand(10),
        completed_at: Time.zone.now - rand(30).days
      }, without_protection: true
    )
  end
end
