class HomeController < ApplicationController
  def index
  end

  def search
    if params[:trade_all]
      searchall(params[:trade_all])
    else
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
              result.push(p) if distance.to_f < 35
            end
          end
        end
      end
      @result = result.uniq
    end
  end

  private

  def searchall(trade)
    @result = []
    trade = trade.to_i
    @trade_search = [trade]
    @search_locate_coordinates = Geocoder.search(params[:state]).first.coordinates
    @search_locate_display = "#{params[:state]}, Australia"
    profile = Trade.find(@trade_search.first).business_profiles.all
    profile.each { |p|
      if p.contact
        lat = p.contact.latitude
        lon = p.contact.longitude
        distance = Geocoder::Calculations.distance_between [lat, lon], @search_locate_coordinates
        @result.push(p) if distance.to_f < 35
      end
    }
    @result
  end
end  #-----------class end
