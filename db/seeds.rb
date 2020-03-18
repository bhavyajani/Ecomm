# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category = ProductCategory.create!(
    Name: "Electronics",
    Description: "Before starting any given page, you really need to wrap your heads around the 
                    primary goal of the page and to whom this page is targeted."
)

10.times do |product|
    category.products.create!(
        Name: "Product #{product}",
        price: 100,
        in_stock: true,
        Description: "Of course, there are companies out there that have great web writers internally, 
                    but most don’t. And the thought of a company turning a great website content 
                    strategy (that we slaved over) into an ineffective 'brochure site' gives me 
                    heartburn. But sometimes you have to pick your battles."
    ) 
end