class BusinessProfilesController < ApplicationController
  before_action :set_business_profile, only: [:edit, :update, :destroy]
  before_action :find_profile, only: [:show]
  # GET /business_profiles
  # GET /business_profiles.json
  def index
    redirect_to "/dashboards"
    # @business_profiles = BusinessProfile.all
  end

  # GET /business_profiles/1
  # GET /business_profiles/1.json
  def show
  end

  # GET /business_profiles/new
  def new
    @business_profile = BusinessProfile.new
  end

  # GET /business_profiles/1/edit
  def edit
  end

  # POST /business_profiles
  # POST /business_profiles.json
  def create
    @business_profile = BusinessProfile.new(business_profile_params)
    if trade_params
      respond_to do |format|
        if @business_profile.save
          b_id = @business_profile.id
          trade_params.each { |t|
            BusinessProfileTrade.create! ({ business_profile: BusinessProfile.find(b_id), trade: t })
          }
          format.html { redirect_to @business_profile, notice: "Business profile was successfully created." }
          format.json { render :show, status: :created, location: @business_profile }
        else
          format.html { render :new }
          format.json { render json: @business_profile.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @err = "Please select at least 1 Trade Profession"
        format.html {
          render :new
        }
      end
    end
  end

  # PATCH/PUT /business_profiles/1
  # PATCH/PUT /business_profiles/1.json
  def update
    if @business_profile.user_id.to_i != current_user.id
      format.html { redirect_to "/", notice: "Error editing profile" }
    else
      respond_to do |format|
        if @business_profile.update(business_profile_params)
          format.html { redirect_to @business_profile, notice: "Business profile was successfully updated." }
          format.json { render :show, status: :ok, location: @business_profile }
        else
          format.html { render :edit }
          format.json { render json: @business_profile.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /business_profiles/1
  # DELETE /business_profiles/1.json
  def destroy
    @business_profile.destroy
    respond_to do |format|
      format.html { redirect_to "/dashboards", notice: "Business profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_business_profile
    if current_user
      if current_user.id == BusinessProfile.find(params[:id]).user_id
        @business_profile = BusinessProfile.find(params[:id])
      else
        redirect_to "/"
      end
    else
      redirect_to "/"
    end
  end

  def find_profile
    @business_profile = BusinessProfile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def business_profile_params
    params.require(:business_profile).permit(:business_name, :business_profile_description, :australian_business_number, :logo_image, images:[]).merge!(:user_id => current_user.id)
  end

  def trade_params
    trade_arr = []
    if !params[:trade]
      return false
    else
      params[:trade].each { |trade|
        unless Trade.find(trade.to_i)
          return false
        else
          trade_arr << Trade.find(trade.to_i)
        end
      }
      return trade_arr
    end
  end
end
