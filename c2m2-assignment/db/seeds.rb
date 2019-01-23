User.destroy_all

u1 = User.create!(username: "Fiorina", password_digest: "password")
u1.profile = Profile.create!(gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina")
u2 = User.create(username: "Trump", password_digest: "password")
u2.profile = Profile.create!(gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump")
u3 = User.create(username: "Carson", password_digest: "password")
u3.profile = Profile.create!(gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson")
u4 = User.create(username: "Clinton", password_digest: "password")
u4.profile = Profile.create!(gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton")

User.all.each do |user|
    tl = user.todo_lists.create!(list_name: "List", list_due_date: Date.today + 1.year)
    5.times do
        tl.todo_items.create!(due_date: Date.today + 1.year, title: "Title", description: "Desc", completed: false)
    end
end