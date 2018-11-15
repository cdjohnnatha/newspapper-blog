# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create([{name: "newspapper_user", email: "user@newspapper.com", password: "newspapperuser"}, {name: "newspapper_user2", email: "user@newspapper2.com", password: "newspapperuser2"}])
article = Article.create([title: "newspapper one", content: "lorem", user_id: user[0].id])
Comment.create([{content: "lorem ipsum", user_id: user[0].id, article_id: article[0].id }, {content: "lorem ipsum", user_id: user[1].id, article_id: article[0].id }])
