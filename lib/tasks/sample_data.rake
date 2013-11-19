namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end
    
    def make_users
    admin = User.create!(name: "Example User",
                 username: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
                 admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      username = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   username: username,
                   password: password,
                   password_confirmation: password)
    end
  end
  
    def make_trips
  users = User.all(limit: 6)
  50.times do
    
    users.each { |user| user.microposts.create!(trip_id: trip_id, title: title, destination: destination, start_date: start_date, end_date: end_date, destination_lat: destination_lat, destination_lng: destination_lng) }
  end
end

def make_tfriends
  users = User.all
  user  = users.first
  friends_users = users[2..50]
  friendss     = users[3..40]
  friends_users.each { |friends| user.addfriend!(friends) }
  friendss.each      { |friend| friend.addfriend!(user) }
end