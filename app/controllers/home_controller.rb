class HomeController < ApplicationController
  helper_method :sort_column, :sort_order, :view_type

  def index
  	 
    if user_signed_in?
      if current_user.uuid == nil
    	  	current_user.uuid =  SecureRandom.hex(10)
    	  	current_user.save
      end 

      @current_user = current_user
      @feed = current_user.films.order("updated_at desc")

    end

    @view = view_type

	  #@films = Film.find(:all, :order => "id desc", :limit => 20, :group => "imbdbcode").paginate(:per_page => 6, :page => params[:page])
	  #@films = Film.search(params[:search]).find(:all, :order => "id desc", :limit => 20, :group => "imbdbcode").paginate(:per_page => 6, :page => params[:page])
    
    items_per_page = 6

    if params[:view_type] == 'list' 
        items_per_page = 30
    end

    @films = Film.order(sort_column + " " + sort_order + ", created_at desc").search(params[:search]).paginate(:per_page => items_per_page, :page => params[:page])


  end

  private
  
  def sort_column
    Film.column_names.include?(params[:sort]) ? params[:sort] : "year"
  end
  
  def sort_order
    %w[asc desc].include?(params[:sort_order]) ? params[:sort_order] : "desc"
  end

  def view_type
    %w[mosaic list].include?(params[:view_type]) ? params[:view_type] : "mosaic"
  end

end
