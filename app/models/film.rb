class Film < ActiveRecord::Base
	has_and_belongs_to_many :users

	def self.search(search)
		if search
			where('title LIKE ?', "%#{search}%").where('quality = "1080p"')
		else
			find(:all, :conditions => {:quality => '1080p'})
			#@films = Film.find(:all, :order => "id desc", :limit => 20, :group => "imbdbcode").paginate(:per_page => 6, :page => params[:page])
		end		
	end

end

