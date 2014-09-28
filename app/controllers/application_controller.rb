class ApplicationController < ActionController::Base
  helper_method :sort_column, :sort_direction

  protect_from_forgery
#  before_filter :authenticate_user!

  private
  def after_sign_out_path_for(resource_or_scope)
#    scope = Devise::Mapping.find_scope!(resource_or_scope)
#    send(:"new_#{scope}_session_path")
	root_path
  end


end
