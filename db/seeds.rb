# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Course.destroy_all

courses_attributes = [
  {
    name: "Portrait Painting",
    description: "Portrait painting is a genre in painting, where the intent is to depict a human subject.",
    price: 30,
    rating: 3,
    category: "Portrait",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496154562/svy4u8zpotvoj3ziqeyb.jpg"
  },
   {
    name: "Landscape Painting",
    description: "Landscape painting, also known as landscape art, is the depiction in art of landscapes – natural scenery such as mountains, valleys, trees, rivers, and forests, especially where the main subject is a wide view – with its elements arranged into a coherent composition.",
    price: 50,
    rating: 4,
    category: "Landscape",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496154582/swekgxpo9qpv5no81ksh.jpg"
  },
   {
    name: "Conceptual Art Painting",
    description: "Conceptual art, sometimes simply called conceptualism, is art in which the concept(s) or idea(s) involved in the work take precedence over traditional aesthetic, technical, and material concerns.",
    price: 70,
    rating: 4,
    category: "Conceptual",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496154602/fs0izpenmw55ntn4vdlg.jpg"
  },
   {
    name: "Pop Art Painting",
    description: "Pop art is an art movement that emerged in the mid-1950s in Britain and the late 1950s in the United States.[1] The movement presented a challenge to traditions of fine art by including imagery from popular and mass culture, such as advertising, comic books and mundane cultural objects.",
    price: 70,
    rating: 4,
    category: "Modern",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496154778/q1je6yn12rhqbcgireb9.jpg"
  },
  {
    name: "Chinese Painting",
    description: "The oldest artistic tradition in the world, Chinese painting, involves techniques used in Calligraphy. The artists use colored inks for painting on paper, silk etc. But, they never use oil for painting.",
    price: 35,
    rating: 5,
    category: "Traditional",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496157349/quyq3g1ne69dqhp2rhm7.jpg"
  },
   {
    name: "Colour Field Painting",
    description: "Colour field paintings are characterized by large, solid colours on a flat plane. The colours are the subjects themselves, and they are normally painted on large canvas material. Compared to abstract expressionism, colour field painters aim to present their paintings as one cohesive image.",
    price: 50,
    rating: 4,
    category: "Landscape",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162091/colour-field_jkizvh.jpg"
  },
   {
    name: "Modern Art Painting",
    description: "Even though many have tried to define modernism, the real modernism has always managed to slip away from those definitions. Somebody had to draw a line and it turned out to be the art critics who took up the responsibility. So, now, Modernism is officially the period between 1860 and 1970.",
    price: 70,
    rating: 4,
    category: "Modern",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162094/modern_art_sdklks.jpg"
  },
   {
    name: "Paint Like Pablo",
    description: "Ever wanted to paint like Pablo Picasso? Do it now!",
    price: 70,
    rating: 4,
    category: "Cubism",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162094/picasso_dvux2q.jpg"
  },
  {
    name: "Paint 'The Scream'",
    description: "Paint Edward Munch's 'The Scream'.",
    price: 40,
    rating: 5,
    category: "Expressionism",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162093/The_Scream_rw5haf.jpg"
  },
   {
    name: "Surrealism Painting",
    description: "Although not the purest form of abstract painting, you will find traces of abstract thinking in Surrealism. This is actually a movement that sprouted in the early 20th century. It included writing and many forms of visual artworks. Obviously, paintings became a big part of this movement. These Surrealistic paintings could strike you with elements of surprise. This remains one of its primary features too. Juxtaposition, placing two abstract concepts together, is another feature of Surrealistic paintings.",
    price: 50,
    rating: 4,
    category: "Surrealism",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162199/surrealism_l1ej5h.jpg"
  },
   {
    name: "Japanese Painting",
    description: "Japanese art can mesmerize you in many ways. If you look at it from the outside, its charm, simplicity and fluency can greatly make you want it. But if you try to learn more about Japanese painting, you will find yourself in a world of bewilderment. If you are not familiar with Japanese terms, you will find this art not so easy. Japanese painting takes influences from Chinese, other eastern and western art.",
    price: 70,
    rating: 4,
    category: "Traditional",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162092/japanese_a40y5x.jpg"
  },
   {
    name: "Abstract Painting",
    description: "Any art that illustrates anything, but not in the truest of forms, can be classified as abstract art. This is a real product of radical thought.",
    price: 70,
    rating: 4,
    category: "Abstract",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162091/abstract_hhnknv.jpg"
  },
  {
    name: "Van Gogh Painting",
    description: "However, in most of his famous creations, he hardly touched the canvas with a brush. Pouring paint onto the canvas was his style of painting. This way he could capture the natural movement of paint too. Another famous expressionist artist is Vincent Van Gogh.",
    price: 30,
    rating: 3,
    category: "Expressionism",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162092/vangogh_z3uwwi.jpg"
  },
   {
    name: "Cubism Painting",
    description: "Today, Cubism is another style of abstract art painting. But, Cubism was a strong presence in the art world even before abstract painting became prevalent. People like Picasso, Braque, Gris etc followed Cubism and made it famous. The world of art painting would have never been the same without contributions from these Cubist artists.",
    price: 50,
    rating: 4,
    category: "Cubism",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162094/cubism_hho67a.jpg"
  },
   {
    name: "Pastel Painting",
    description: "Pastel sticks are normally used to create the pastel paintings. Using pastel sticks you can immediately start drawing and colouring, it uses the same binding pigments, except pastel sticks are a powder form which are bound together using a binding agent, and they are readymade. If you are looking for pure and deep colours, then it's highly recommended to use the pastel sticks. Pastel paintings can be done on canvas, so you can do beautiful layering of colours with pastels.",
    price: 30,
    rating: 4,
    category: "Conceptual",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162092/pastel_w6s1mz.jpg"
  },
   {
    name: "Indian Painting",
    description: "Being extremely diverse in culture, you can expect Indian painting tradition to be diverse as well. Indian painting is mostly a direct result of traditions and changing life styles over the years. You would even find Indian rock paintings dating back to as early as 5500 BC. The caves of Ajanta and Ellora are famous for its mural paintings.",
    price: 100,
    rating: 4,
    category: "Traditional",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162091/indian_covbqe.jpg"
  },
  {
    name: "Acryllic Painting",
    description: "If you are looking for faster drying painting, then acrylic painting is the best. These are water soluble paints, yet once the painting is complete, it turns water resistant. Interesting fact isnt't it? Most hobbyists love to work with acrylic paints. For sculptures, moulding, facial features, many artists use acrylic painting. It is easier to clean the brushes after ise, since acrylic paints need only water to wash them off.",
    price: 30,
    rating: 3,
    category: "Acryllic",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162091/acryllic_if9zxe.jpg"
  },
   {
    name: "Sand Painting",
    description: "Painting on sand can be quite messy and it's a temporary art. The sand painting can be captured on video using speed motion, to understand how the artist works on them. It's normally done with minimal light, but has a focus light under the table where the sand painting is being created. Sand painting is created using coloured sands, which is moved around on a fixed surface using hands. It is practised in many countries and is known by several names, in India it's known as kolam or rangoli.",
    price: 50,
    rating: 4,
    category: "Sand Painting",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162090/sand_totdo5.jpg"
  },
   {
    name: "Digital Painting",
    description: "Digital painting is the art of creating artwork on a computer, which makes it resemble a watercolour painting, oil painting or even an acrylic painting. A digitally prepared oil painting and manually done oil painting will have plenty of differences, since you have access to plenty of other textures and instruments which are easily available on the system. Yes, you don't have to worry about paint spills a standing for long hours. You can do the same art in a relaxed manner, at the comfort of your homes.",
    price: 70,
    rating: 4,
    category: "Digital",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162090/digital_trf1yy.jpg"
  },
   {
    name: "Watercolour Painting",
    description: "Watercolour painting is usually done on the paper. In this particuar type of painting, one uses water based solutions to mix the colours and hence the name water color painting. Compared to oil painting, watercolor painting is also similarly tough task. Nowadays you have plenty of artists trying out realistic looking portraits using watercolors. The mixing of colors is very crucial in this, since too much of anything, changes the shade of the colors.",
    price: 70,
    rating: 4,
    category: "Watercolour",
    photo: "http://res.cloudinary.com/hw3i/image/upload/v1496162094/watercolour_fpkwmp.jpg"
  }
]


10.times do
  user = User.create!(
    email: Faker::Internet.free_email,
    password: '123456',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  rand(2..6).times do
    attrs = courses_attributes.sample.merge(user: user)
    attrs_no_photo = attrs.slice(:name, :description, :price, :rating, :category, :user)
    c = Course.create!(attrs_no_photo)
    c.photo_url = attrs[:photo]
  end
end
