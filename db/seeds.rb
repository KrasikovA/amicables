# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
BackImage.create(
		[
			{name: 'about',image: File.new("#{Rails.root}/app/assets/images/aboutBack.png")},
			{name: 'home',image: File.new("#{Rails.root}/app/assets/images/mainBack.png")},
			{name: 'releases',image: File.new("#{Rails.root}/app/assets/images/mainBack.png")},
			{name: 'bands',image: File.new("#{Rails.root}/app/assets/images/mainBack.png")}
		]
	)
AboutPage.create(description: "<p>Some fill text</p>")