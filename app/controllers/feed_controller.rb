class FeedController < ActionController::Base

 def show
    # this will be the name of the feed displayed on the feed reader
    @user = User.where(uuid: params[:id]).first

	  @title = "Your feed " + @user.email	 

    # the news items
    @news_items = @user.films.order("updated_at desc")

    # this will be our Feed's update timestamp
    @updated = @news_items.first.updated_at unless @news_items.empty?

 	  respond_to do |format|
      format.html { render :layout => false}# show.html.erb
    end

  end


  def feed
  end


 def index
 end

end
