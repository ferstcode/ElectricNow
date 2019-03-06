# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



@user = User.last
Detection.destroy_all
Detection.create(
    user_id: @user.id,
    detail: "Salen chispas de esta cosa que esta en el patio!!",
    image: "http://www.comuval.com/images/imagenes-blog/proteccion-instalacion-electrica.jpg",
    address: "fray camilo",
    commune: "Santiago",
    date: "20-02-2018",
    hour: "14:00"

)
Detection.create(
    user_id: @user.id,
    detail: "0000000000000000",
    image: "https://misanimales.com/wp-content/uploads/2014/12/gato-enfermo.jpg",
    address: "fray camilo",
    commune: "Santiago",
    date: "10-02-2018",
    hour: "16:00"  
)