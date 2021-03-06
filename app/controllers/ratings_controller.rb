class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    redirect_to "/"
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    redirect_to "/"
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # # GET /ratings/1/edit
  # def edit
  # end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to "/business_profiles/#{@rating.business_profile_id}", notice: "Rating was successfully created." }
      end
    end
  end

  # # PATCH/PUT /ratings/1
  # # PATCH/PUT /ratings/1.json
  # def update
  #   respond_to do |format|
  #     if @rating.update(rating_params)
  #       format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @rating }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @rating.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    if @rating.business_profile.user.role == Role.find(1)
      @rating.destroy
      redirect_to "/business_profiles/#{@rating.business_profile_id}"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rating
    @rating = Rating.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rating_params
    params.require(:rating).permit(:business_profile_id, :star_rating, :comment, :user_name)
  end
end
