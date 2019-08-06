class MembershipsController < ApplicationController
    def new
        @membership = Membership.new
        @business_profile = BusinessProfile.find(params[:id])
    end

    def create
        @membership = Membership.new
        @membership.business_profile_id = membership_params[:business_profile_id]
        @membership.save!
    end
    




    private

  # Use callbacks to share common setup or constraints between actions.


  # Never trust parameters from the scary internet, only allow the white list through.
  def membership_params
    params.require(:membership).permit(:business_profile_id)
  end

end
