class Album < ActiveRecord::Base
	belongs_to :bands
	belongs_to :releases
	def self.all
		query = <<-SQL
		select comp_name, array_to_string(array_agg(release_id),',') as releases from 
			(
				select release_id,string_agg(name,'/') as comp_name from
					(
						select distinct(albums.band_id), albums.release_id,bands.name from albums inner join bands
							on albums.band_id = bands.id
					) as sub2
				group by release_id
			) as sub1
		group by comp_name
		SQL
		response = ActiveRecord::Base.connection.execute(query)
		response_arr = response.to_a
		response_arr.each do |album|
			album["releases"] = album["releases"].split(",").map(&:to_i)
			album["comp_url_name"] = album["comp_name"].gsub(/ /,'_').gsub(/\//,'-')
		end
		response_arr
	end
end