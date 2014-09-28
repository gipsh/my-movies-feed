class FilmsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @film = Film.find(params[:format])

    @user.films << @film

    redirect_to @film
  end


  def show
    @user = User.find(params[:user_id])
    @film = Film.find(params[:id])

    @user.films.delete(@film)

    redirect_to @film
  
  end


end
