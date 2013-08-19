namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 username: "example@railstutorial.org",
                 password: "foobar"
                 )
    99.times do |n|
      name  = Faker::Name.name
      username = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   username: username,
                   password: password
                  )
    end
  end
end
