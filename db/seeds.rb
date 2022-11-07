puts "🌱 Seeding data..."

# place your seeds here

Category.create(name: "chores")
Category.create(name: "personal")
Category.create(name: "work")

Category.all.each do |c|
    6.times do
        TodoList.create(
            title:Faker::Lorem.sentence(word_count: 5),
            description: Faker::Lorem.paragraph(sentence_count: 4),
            category_id: c.id,
            status: false
        )
    end
end

puts "🌱 Done seeding!"
