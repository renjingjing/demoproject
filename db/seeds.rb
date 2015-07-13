# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["Abstract", "Modern", "Portrait", "Landscape", "Still Life", "Nature"].each do |name|
  Category.create(name: name)
end

  name = "Robert Bujese"
  information  = "Our talented artists have created hundreds of
        thousandths of paintings for art lovers around the world,
        as well as clients that include the Royal Family, major hotel chains,
        luxury cruise-liners, museums, interior design firms, the largest real
        estate developers, Hollywood production companies and many more."
  Producer.create({name: name,information: information})

  name = "Arlen Keen"
  information  = "He received early training in painting
        from his father Vincenzo, who specialized in paintings of architectural interiors,
        and Abbati's own early paintings were interiors.He participated in Garibaldi's 1860
        campaign, suffering the loss of his right eye at the Battle of Capua. Afterwards he moved
        lorence where, at the Caffè Michelangiolo, he met Giovanni Fattori, Silvestro Lega, and the
        rest of the artists who would soon be dubbed the Macchiaioli."
  Producer.create({name: name,information: information})

  name = "Lily Hathaway"
  information  = "Her family lineage traces back to John Adams,
        the second president of the United States. Her mother, Elizabeth Grinnell, was a poet and
        syndicated columnist with Hearst newspapers.[1] After World War II, Abbott joined
        the Downtown Group, which represented a group of artists who lived in lower Manhattan."
  Producer.create({name: name,information: information})

  title = "Almond Blossom"
  description  = "from a group of several paintings made in 1888 and 1890 by Lily Hathaway
                in Arles and Saint-Rémy, southern France of blossoming almond trees. Flowering
                trees were special to Van Gogh. They represented awakening and hope. She enjoyed
                them aesthetically and found joy in painting flowering trees. The works reflect
                Impressionist, Divisionist and Japanese woodcut influences. "
  price        = 100
  sku          ="jdkid239"
  quantity     = 5
  category_id  = 4
  producer_id  = 3
  Product.create({title: title,description: description,price:price,sku:sku,quantity:quantity,category_id:category_id,producer_id:producer_id})

  title = "Rembrandt"
  description  = "This painting by Rembrandt shows how oil paint can be used to show texture such
                  as flesh, hair, cloth, leaves, fruit, gold and pearls. "
  price        = 100
  sku          ="jdkid232"
  quantity     = 3
  category_id  = 3
  producer_id  = 2
  Product.create({title: title,description: description,price:price,sku:sku,quantity:quantity,category_id:category_id,producer_id:producer_id})

  title = "Red Onion"
  description  = "One of my original oil still life vegetable paintings, this one featuring a
                      red onion with a strong white center on a green and white background.
                      Keywords: red, vegetable, still life, red onion, colorful, food, green, onion "
  price        = 100
  sku          ="jdkid236"
  quantity     = 2
  category_id  = 5
  producer_id  = 1
  Product.create({title: title,description: description,price:price,sku:sku,quantity:quantity,category_id:category_id,producer_id:producer_id})
