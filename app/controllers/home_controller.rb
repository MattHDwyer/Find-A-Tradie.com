class HomeController < ApplicationController
  def index
  end

  def search
    @result = []
    @trade_search = []
    @trade_search = params[:trade]
    location = Geocoder.search(params[:location])
    search_locate = location.find { |l| l.country == "Australia" }
    # @search_lat = search_locate.coordinates.first
    # @search_lon = search_locate.coordinates.last

    if !@trade_search.empty?
      @trade_search.each do |t|
        profile = Trade.find(t).business_profiles.all
        profile.each do |p|
          lat = p.contact.latitude
          lon = p.contact.longitude
          distance = Geocoder::Calculations.distance_between [lat, lon], search_locate.coordinates
          @result << p if distance.to_f < 30
        end
      end
    end
  end
end
