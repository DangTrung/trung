# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
cate = CategoryArticle.create!([{name: 'Sport'}, {name: 'Business'}, {name: 'Entertainment'}, {name: 'Food'}])
content = Article.create!([{title: 'GDragon coming back soom', short_description: 'Trưởng nhóm BigBag đình dám một thời thông báo sẽ quay trở lại sớm', image_url: 'download.jpg', content: 'fdsafsafkdsakfjdafhsahfjkdasjkfajslfkdahkfhdkashfsa'},
    {title: 'Vang Tang', short_description: 'Hom nay vang lai tang', image_url: 'news-350x223-1.jpg', content: 'vang tang the thoi'},
    {title:'Mariah Carey said : its time', short_description: 'its Xmastime coming', image_url: 'news-350x223-5.jpg', content: 'Thefdsaf as fdsa dsa vdsa dsa fda f '},
    {title: 'Them cai vao tin da bong', short_description: 'cha biet ghi gi', image_url: 'news-450x350-1.jpg', content: 'dsafdsafkdasfdsajf'}])
comment = Comment.create!([{name: 'Trung dang', email: 'dangtrung@gmial.com', content: 'i dont know him', article_id: 1},
    {name: 'padd', email: 'padddy@gmail.com', content: 'her time get rich', article_id: 3}])



 
#content = Article.create!([{ title: 'Mariah Carey said : its time', short_description: 'its Xmastime coming', image_url: 'news-350x223-5.jpg', content: 'hahahahahahahahahahahahahaha'},
 #   {title: 'Them cai vao tin da bong', short_description: 'cha biet ghi gi', image_url: 'news-450x350-1.jpg', content: 'dsafdsafkdasfdsajf'}])
art = CateArt.create!([{ category_article_id: 1, article_id: 4 }, { category_article_id: 4, article_id: 1 }, { category_article_id: 3, article_id: 2 }, { category_article_id: 4, article_id: 2 }, { category_article_id: 5, article_id: 2 }])

#comment = Comment.create([{ name: 'Trung dang', email: 'dangtrung@gmial.com', content: 'i dont know him', article_id: 1}, {name: 'padd', email: 'padddy@gmail.com', content: 'her time get rich', article_id: 3}])
=end
user = User.create!( [name: 'Trung', email: 'dangthanhtrung30@gmail.com', password: 'Aa123456789', role_id: 1])
#role = Role.create!([{role_name: 'admin'},{role_name: 'user1'}, {role_name: 'user2'}])
#per = Permission.create!([{action_name: 0, action: 0}, {action_name: 0, action: 1}, {action_name: 0, action: 2}, {action_name: 0, action: 3}, {action_name: 1, action: 0}, {action_name: 1, action: 1}, {action_name: 1, action: 2}, {action_name: 1, action: 3}])