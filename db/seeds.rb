require 'faker'

random = Random.new

user_names = [ 'amzans', 'cactus_99', 'vgent', 'marius', 'brandon_f', 'dh_andersen' ]

user_names.each do |user_name|
  User.create(user_name: user_name, email: "#{user_name}@gmail.com", password: Faker::Internet.password, bio: Faker::Lorem.sentence)
end

user_names.each do |user_name|
  user = User.find_by(user_name: user_name)
  random.rand(5..14).times do 
    Post.create(user: user, message: Faker::Lorem.sentence, created_at: Faker::Date.between(30.days.ago, Date.today))
  end
end

user_names.each do |user_name|
  user = User.find_by(user_name: user_name)
  random.rand(80..200).times do 
    Comment.create(user: user, post: Post.find(random.rand(1..Post.count)), body: Faker::Lorem.sentence)
  end
end

user_names.each do |user_name|
  user = User.find_by(user_name: user_name)
  random.rand(80..200).times do 
    Post.find(random.rand(1..Post.count)).liked_by user
  end
end

user_names.each do |user_name|
    other_user_names = user_names - [user_name]
    user_a = User.find_by(user_name: user_name)
    
    other_user_names.each do |other_user_name|
      user_b = User.find_by(user_name: other_user_name)
      Follow.create(follower_id: user_a.id, following_id: user_b.id)
    end
end