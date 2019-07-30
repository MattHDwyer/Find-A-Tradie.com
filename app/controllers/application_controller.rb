class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery

    # protected

    def after_sign_in_path_for(resource)
        "/dashboards/"+"#{current_user.id}"
    end

    def after_sign_out_path_for(resource)
        '/'
        # "/dashboards/signout"
        # another_option
    end
end
