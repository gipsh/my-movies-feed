require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton


s.every '30m' do
  Rails.logger.info "updating movies: it's #{Time.now}"

  tmdb_api_key = '374fb751924df3442d74e979d8f1c07f'

  response = HTTParty.get("https://yts.re/api/list.json")
  json = JSON.parse(response.body)

	json['MovieList'].each do |object|
    # This is a hash object so now create a new one.
  	# f = Film.find(object['MovieID'] )
  	  
  	  if not (Film.exists?(object['MovieID']))# and (object['Quality']=='1080p')


        responseOmdb = HTTParty.get("http://www.omdbapi.com/?i="+object['ImdbCode'])
        jsonOmdb = JSON.parse(responseOmdb)
        #poster = jsonOmdb['Poster'] 
        plot = jsonOmdb['Plot']
        #p poster

        # get from tmdb 
        tmdb_api_key = '374fb751924df3442d74e979d8f1c07f'

        url = "https://api.themoviedb.org/3/movie/" +  object['ImdbCode'] + "?api_key="+ tmdb_api_key
        response = HTTParty.get(url)
        json = JSON.parse(response.body)
        poster = "http://image.tmdb.org/t/p/w300" + json['poster_path']


	  	  film = Film.new

	  	  film.id = object['MovieID'] 
	  	  film.title = object['MovieTitleClean'] 
	  	  film.quality = object['Quality']	
        film.magnet = object['TorrentMagnetUrl']
        film.year = object['MovieYear']
        film.cover = poster
        film.description = plot
        film.imbdbcode = object['ImdbCode']
        film.rating = object['MovieRating']
        film.imdb = object['ImdbLink']
        film.size = object['Size']
        film.sizebytes = object['SizeByte']        
        film.genere = object['Genre']
        film.link = object['TorrentUrl']
        film.published = object['DateUploaded']
   
	  	  film.save
      else
        p "alredy have this movie " + object['MovieTitle']
	  end
    end
end
