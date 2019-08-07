class HomeController < ApplicationController
  def index
  end

  def search
    count = 0
    result = []
    @trade_search = []
    @trade_search = params[:trade] if params[:trade]
    location = Geocoder.search(params[:location])
    search_locate = location.find { |l| l.country == "Australia" }
    @search_locate_coordinates = search_locate.coordinates
    @search_locate_display = search_locate.display_name
    if @trade_search.length > 0
      @trade_search.each do |t|
        profile = Trade.find(t.to_i).business_profiles.all

        profile.each do |p|
          if p.contact
            lat = p.contact.latitude
            lon = p.contact.longitude
            distance = Geocoder::Calculations.distance_between [lat, lon], @search_locate_coordinates
            result.push(p) if distance.to_f < 30
            # count += 1
            # if count == 3
            #   raise
            # end
          end
        end
      end
    end

    @result = result.uniq
  end
end
