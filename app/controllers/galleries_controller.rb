class GalleriesController < ApplicationController
    def new
        @business_profile = BusinessProfile.find(params[:id])
    end
end
