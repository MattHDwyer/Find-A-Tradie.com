class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  protected

  def after_sign_in_path_for(resource)
    "/dashboards/"
  end

  def after_sign_out_path_for(resource)
    "/"
  end
end
