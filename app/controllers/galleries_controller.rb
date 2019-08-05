class GalleriesController < ApplicationController
    def new
        @business_profile = BusinessProfile.find(params[:id])
    end

    def edit
        @business_profile = BusinessProfile.find(params[:id])
    end

    def photo_destroy

    end
end
