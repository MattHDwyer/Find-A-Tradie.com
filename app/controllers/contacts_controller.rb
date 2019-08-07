class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    redirect_to "/dashboards"
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    redirect_to "/dashboards"
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @business_profile_id = params[:id]
  end

  # GET /contacts/1/edit
  def edit
    @business_profile_id = params[:id]
  end

  # POST /contacts
  # POST /contacts.json
  def create
    cp = contact_params
    if !cp
      respond_to do |format|
        format.html { redirect_to "/contacts/new/#{params[:id]}", notice: "Address not exist" }
      end
    else
      @contact = Contact.new(cp)
      respond_to do |format|
        if @contact.save
          format.html { redirect_to "/dashboards", notice: "Contact was successfully created." }
          format.json { render :show, status: :created, location: @contact }
        else
          format.html { render :new }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    cp = edit_contact_params
    if !cp
      respond_to do |format|
        format.html { redirect_to "/contacts/#{params[:id]}/edit/", alert: "Address not exist" }
      end
    else
      respond_to do |format|
        if @contact.update(cp)
          @contact.save
          format.html { redirect_to "/dashboards", notice: "Contact was successfully updated." }
          format.json { render :show, status: :ok, location: @contact }
        else
          format.html { render :edit }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    if Contact.find(params[:id].to_i).business_profile.user == current_user
      @contact = Contact.find(params[:id])
    else
      respond_to do |format|
        format.html { redirect_to "/", notice: "Error editing contact" }
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    #check if current user are the one who add the contact to profile
    if BusinessProfile.find(params[:id].to_i).user == current_user
      p = params.require(:contact).permit(:email, :mobile_number, :landline_number, :full_address).merge!(:business_profile_id => params[:id])
      x = p[:full_address]
      locates = Geocoder.search(x)
      if locates.length > 0
        locate = locates.find { |l| l.country == "Australia" }
        p.merge!(:longitude => locate.coordinates.last)
        p.merge!(:latitude => locate.coordinates.first)
        return p
      else
        false
      end
    else
      respond_to do |format|
        format.html { redirect_to "/dashboards", notice: "Error adding contact" }
        false
      end
    end
  end

  def edit_contact_params
    #check if current user are the one who add the contact to profile
    if Contact.find(params[:id].to_i).business_profile.user == current_user
      p = params.require(:contact).permit(:email, :mobile_number, :landline_number, :full_address).merge!(:business_profile_id => Contact.find(params[:id].to_i).business_profile.id)
      x = p[:full_address]
      locates = Geocoder.search(x)
      if locates.length > 0
        locate = locates.find { |l| l.country == "Australia" }
        p.merge!(:longitude => locate.coordinates.last)
        p.merge!(:latitude => locate.coordinates.first)
        return p
      else
        false
      end
    else
      false
    end
  end
end
