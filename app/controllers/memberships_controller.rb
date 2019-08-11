
    class MembershipsController < ApplicationController
        def new
            @membership = Membership.new
            @business_profile = BusinessProfile.find(params[:id])
        end


        def create
            @membership = Membership.new
            @membership.business_profile_id = membership_params[:business_profile_id]
            @membership.start_date = membership_params[:start_date]
            @membership.end_date = membership_params[:end_date]
            @membership.save!
            redirect_to dashboards_path
        end

        def edit
          @membership = Membership.find(params[:id])
          @business_profile = @membership.business_profile
        end

        def update 
          @membership = Membership.find(params[:id])
          @membership.end_date = membership_params[:end_date]
          @membership.business_profile_id = membership_params[:business_profile_id]
          @membership.save!
          raise
          redirect_to dashboards_path
        end


        
        private
      # Use callbacks to share common setup or constraints between actions.
      # Never trust parameters from the scary internet, only allow the white list through.
      def membership_params
        params.require(:membership).permit(:business_profile_id, :start_date, :end_date)
      end
    end
    
