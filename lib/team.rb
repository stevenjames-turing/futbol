require 'csv'
puts 'team initialized'

contents = CSV.open(
  'data/teams.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  team_id = row[:team_id]
  franchise_id = row[:franchiseid]
  name = row[:teamname]
  abbreviation = row[:abbreviation]
  stadium = row[:stadium]
  link = row[:link]
  puts link
end
