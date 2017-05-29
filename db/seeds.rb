# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Course.destroy_all

10.times do
  User.create!(
    email: Faker::Internet.free_email,
    password: '123456'
  )
end

courses_attributes = [
  {
    name: "Portrait Paiting",
    description: "Portrait painting is a genre in painting, where the intent is to depict a human subject.",
    price: 30,
    rating: 3,
    category: "Portrait",
    user_id: 1
  },
   {
    name: "Landscape Paiting",
    description: "Landscape painting, also known as landscape art, is the depiction in art of landscapes – natural scenery such as mountains, valleys, trees, rivers, and forests, especially where the main subject is a wide view – with its elements arranged into a coherent composition.",
    price: 50,
    rating: 4,
    category: "Landscape",
    user_id: 2
  },
   {
    name: "Conceptual Art Painting",
    description: "Conceptual art, sometimes simply called conceptualism, is art in which the concept(s) or idea(s) involved in the work take precedence over traditional aesthetic, technical, and material concerns.",
    price: 70,
    rating: 4,
    category: "Conceptual Art",
    user_id: 3
  },
   {
    name: "Pop Art Painting",
    description: "Pop art is an art movement that emerged in the mid-1950s in Britain and the late 1950s in the United States.[1] The movement presented a challenge to traditions of fine art by including imagery from popular and mass culture, such as advertising, comic books and mundane cultural objects.",
    price: 70,
    rating: 4,
    category: "Conceptual Art",
    user_id: 4
  },
]

courses_attributes.each do |courses_attribute|
  Course.create!(courses_attribute)
end

