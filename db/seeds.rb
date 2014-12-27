# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
    email: "admin@example.com",
    password: "1234",
    password_confirmation: "1234",
    admin: true
)
u.skip_confirmation!
u.save!



# Test user accounts
(1..50).each do |i|
  u = User.new(
      email: "user#{i}@example.com",
      password: "1234",
      password_confirmation: "1234"
  )
  u.skip_confirmation!
  u.save!

  puts "#{i} test users created..." if (i % 5 == 0)

end


CustomRoute.create(owner: User.admins.first, name: "Route 1", data: "[{\"testing1\": \"a thing\"}]", version: 1)
CustomRoute.create(owner: User.admins.first, name: "Route 2", data: "[{\"testing2\": \"another thing\"}]", version: 1)