# Production.destroy_all
# CrewMember.destroy_all

Production.create(title: Faker::Company.name, genre: Faker::Music.genre, budget: Faker::Commerce.price, image:Faker::Avatar.image,director: Faker::Name.name, ongoing: true)
CrewMember.create(name: Faker::Name.name, job_title: Faker::Company.profession)