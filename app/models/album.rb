class Album < ActiveRecord::Base
	belongs_to :band
	belongs_to :release
	def self.band_names
		query = %{
		select comp_url_name, comp_name, array_to_string(array_agg(release_id),',') as releases from
			(
				select release_id,string_agg(name,'/') as comp_name,string_agg(url_name,'-') as comp_url_name  from
					(
						select distinct(albums.band_id), albums.release_id,bands.name,bands.url_name from albums inner join bands
							on albums.band_id = bands.id
					) as sub2
				group by release_id
			) as sub1
		group by comp_name, comp_url_name
		}
		response = ActiveRecord::Base.connection.execute(query)
		response_arr = response.to_a
		response_arr.each do |album|
			album["releases"] = album["releases"].split(",").map(&:to_i)
		end
		response_arr
	end
end
