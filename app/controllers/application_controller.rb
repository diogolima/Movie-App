class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_ransack

  private
  def set_ransack
  @search = Movie.ransack(params[:q])  
  end

end
