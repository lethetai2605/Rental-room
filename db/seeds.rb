r1 = Role.create(name: 'Admin')
r2 = Role.create(name: 'Host')
r3 = Role.create(name: 'Guest')

Account.create!(email: 'admin@admin.com',
                password: '123456',
                password_confirmation: '123456',
                role_id: r1.id)

(0...10).each do |n|
    email = "example-#{n + 1}@rentalroom.com"
    password = '123456'
    Account.create!(email: email,
                    password: password,
                    password_confirmation: password,
                    role_id: r2.id)
end

(10...20).each do |n|
  email = "example-#{n + 1}@rentalroom.com"
  password = '123456'
  Account.create!(email: email,
                  password: password,
                  password_confirmation: password,
                  role_id: r3.id)
end

rt1 = RoomType.create(name: 'Can ho dich vu')
rt2 = RoomType.create(name: 'Studio')
rt3 = RoomType.create(name: 'Chung cu')

Profile.create!({name: "Admin",
                 phone: "0123456789",
                 address: "Dong da, Ha Noi",
                 dob: '22/02/2020',
                 gender: 1,
                 account_id: 1})
