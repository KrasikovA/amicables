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
AboutPage.create(description: "<hr><p>we decided once that the noise our friends make should be documented. our aim is to produce some special kind of artifacts, not just to pack music up, therefore we focus much on cover art and all to make each thing really unique. available stuff can be purchased at our discogs store. also, everything can (and should) be listened and downloaded for free at our bandcamp.</p><p>feel free to turn to us with whatever question you have. 002197@gmail.com</p><p>cheers from moscow</p>")

eyrie = Band.create(
		{name: 'eyrie',description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"}
)
awaara = Band.create(
	{name: 'awaara',description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"}
)
haunted = Band.create(
	{name: 'haunted',description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"}
)
jack_the_knife = Band.create(
	{name: 'jack the knife',description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"}
)

BandImage.create(
	[
		{image: File.new("#{Rails.root}/app/assets/images/rainy_forest1.jpg"),band: eyrie},
		{image: File.new("#{Rails.root}/app/assets/images/rainy_forest2.jpg"),band: eyrie}
	]
)
BandImage.create(
	[
		{image: File.new("#{Rails.root}/app/assets/images/rainy_forest1.jpg"),band: awaara},
		{image: File.new("#{Rails.root}/app/assets/images/rainy_forest2.jpg"),band: awaara}
	]
)
BandImage.create(
	[
		{image: File.new("#{Rails.root}/app/assets/images/rainy_forest1.jpg"),band: haunted},
		{image: File.new("#{Rails.root}/app/assets/images/rainy_forest2.jpg"),band: haunted}
	]
)
BandImage.create(
	[
		{image: File.new("#{Rails.root}/app/assets/images/rainy_forest1.jpg"),band: jack_the_knife},
		{image: File.new("#{Rails.root}/app/assets/images/rainy_forest2.jpg"),band: jack_the_knife}
	]
)

