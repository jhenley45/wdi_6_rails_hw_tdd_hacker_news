
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jack = User.create!(id: 101, email: 'jack@yahoo44.com', password: 'password', about: 'something')

10.times do |i|
  article = Article.create!(user_id: 101, title: Faker::Lorem.word, url: Faker::Internet.url, description: Faker::Lorem.paragraphs(i%10).join(' ') )
  puts "Created Article #{i}"

  rand(5).times do |i|
    the_user = User.find(101)
    article.comments.create!(content: Faker::Lorem.paragraphs(i+1).join(' '), user: the_user)
    puts "Created comment for #{article.title} "
  end
end
