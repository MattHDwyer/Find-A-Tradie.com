class ApplicationController < ActionController::Base
<<<<<<< HEAD
  include Pundit
  protect_from_forgery
=======
    include Pundit
    protect_from_forgery

    protected

    def after_sign_in_path_for(resource)
      "/dashboards/"+"#{current_user.id}"
    end
  
    def after_sign_out_path_for(resource)
      "/"
    end


>>>>>>> master
end
