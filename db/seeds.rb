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

eyrie_release = Release.create(name: 'Untitled', description: 'as ever, everything went just not like we wanted. could not help it')
eyrie_demo = Release.create(name: "Demo", description: "eyrie demo demo demo demo")
jack_haunted_release =  Release.create(name: '',description: "4 synth punk pieces from moscow & 2 garage pop + 2 synth punk/pop tracks from saint-petersburg bring you simplicity and purity that can be found only in stuff that was never meant to be heard. long live bedroom recordings! issued in Haunted's old jeans with glued-on pictures. don't miss one.")
awaara_release = Release.create(name: "the one and only posthumous album. 3 songs and 4 instrumental tracks of punk and love.issued in printed fabric bags with 40 cm high folded inserts of band pictures and photos of karjala & a few with 22x15cm printed fabric inserts, watercoloured inner cardboard sleeves, hand-written tracklist and labels.")
Album.create(band_id: eyrie.id,release_id: eyrie_demo.id)
Album.create(band_id: eyrie.id, release_id: eyrie_release.id)
Album.create(band_id: jack_the_knife.id, release_id: jack_haunted_release.id)
Album.create(band_id: haunted.id, release_id: jack_haunted_release.id)
Album.create(band_id: awaara.id,release_id: awaara_release.id)


