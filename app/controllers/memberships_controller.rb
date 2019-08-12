
class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
    @business_profile = BusinessProfile.find(params[:id])
  end

  def create
    create_stripe()
    @membership = Membership.new
    @membership.business_profile_id = membership_params[:business_profile_id]
    @membership.start_date = membership_params[:start_date]
    @membership.end_date = membership_params[:end_date]
    @membership.save!
    @amount = params[:amount].to_f
  end

  def edit
    @membership = Membership.find(params[:id])
    @business_profile = @membership.business_profile
  end

  def update
    create_stripe()
    @membership = Membership.find(params[:id])
    @membership.end_date = membership_params[:end_date]
    @membership.business_profile_id = membership_params[:business_profile_id]
    @membership.save!
    @amount = params[:amount].to_f
  end

  def create_stripe
    # Amount in cents
    @amount = 100 * params[:amount].to_i
    @amount_show = params[:amount].to_i
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Rails Stripe customer",
      currency: "aud",
    })
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
    raise
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Never trust parameters from the scary internet, only allow the white list through.
  def membership_params
    params.require(:membership).permit(:business_profile_id, :start_date, :end_date)
  end
end
