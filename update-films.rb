

tmdb_api_key = '374fb751924df3442d74e979d8f1c07f'

@films = Film.all
@films.each do |film|
	if !film.cover.index("media-imdb").nil?
		p film.title
		p film.cover

        	url = "https://api.themoviedb.org/3/movie/" +  film.imbdbcode + "?api_key="+ tmdb_api_key
        	response = HTTParty.get(url)
        	json = JSON.parse(response.body)
		newcover =  "http://image.tmdb.org/t/p/w300" + json['poster_path']

		#p newcover

		film.cover = newcover
		film.save
		
	end
	
end




