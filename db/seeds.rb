50.times do
    Category.create({
        title: Faker::App.name,
        description: Faker::ChuckNorris.fact
    })
end 

