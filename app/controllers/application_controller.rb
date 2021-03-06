class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :set_ransack

  private
  def set_ransack
    @search = Movie.ransack(params[:q])
  end

end
