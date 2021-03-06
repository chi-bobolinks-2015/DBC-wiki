# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  User.create(
    :username => Faker::Name.name,
    :email => Faker::Internet.email,
    :admin => true,
    :password => Faker::Internet.password
    )
end

User.create(
  :username => "Henry",
  :email => "sidgwick@gmail.com",
  :admin => true,
  :password => "1Z2X3C4V5t"
  )

45.times do
  User.create(
    :username => Faker::Name.name,
    :email => Faker::Internet.email,
    :admin => false,
    :password => Faker::Internet.password
    )
end


25.times do
  category = Category.create!(
    :name => Faker::Hacker.noun
    )

  rand(10..25).times do
    article = category.articles.create!(
      :user_id => rand(1..50)
      )

    use_this_title = Faker::Hipster.sentence(3, false, 3)
    article_content = Faker::Hipster.paragraph(2, false, 2)

    rand(5..15).times do
      edit = article.edits.create!(
        :author_id => rand(1..50),
        :approved => [true, true, true, false].sample,
        :title => use_this_title,
        :content => Faker::Hipster.paragraph(2) + article_content + "\n" + (Faker::Hipster.paragraphs(rand(4..7))).join("\n"),
        :featured => false
        )
      if edit.approved == true
        edit.approver_id = rand(1..5)
      end
    end
  end
  Edit.find(1).update(featured: true)
end

800.times do
  Comment.create(
    :content => Faker::Hipster.sentence(3, false, 3),
    :article_id => rand(1..800),
    :commenter_id => rand(1..50)
    )
end
