class FilmController < ApplicationController
  def show
    @film = Film.find(params[:id])

    if user_signed_in?
      @alredy = current_user.film_ids.include? @film.id

  	  @current_user = current_user 
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @film }
    end
  end



  def add
	@curent_user = current_user

	@f = Film.find(params[:format])

	logger.debug "hola"
	@current_user.films.create(:user_id  => @current_user.id, :film_id => @f.id)

	@current_user.save

	p "hola!! hola!"
	redirect_to :back

  end

  def remove
  end
end