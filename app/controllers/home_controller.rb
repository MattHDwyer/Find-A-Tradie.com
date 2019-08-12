class HomeController < ApplicationController
  def index
  end

  def search
    @result = []
    @url = request.original_url.split("&sort=").first

    if params[:trade_all]
      result = searchall(params[:trade_all])
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
            if p.contact && check_membership(p)
              lat = p.contact.latitude
              lon = p.contact.longitude
              distance = Geocoder::Calculations.distance_between [lat, lon], @search_locate_coordinates
              rating = p.ratings.length > 0 ? get_average_star(p.ratings) : 0
              result.push([p, distance, rating]) if distance.to_f < 35
            end
          end
        end
      end
    end
    result = result.uniq
    if params[:sort] == "distance"
      result.sort_by! { |arr| arr[1] }
    end
    if params[:sort] == "rating"
      result.sort_by! { |arr| arr.last }
      result.reverse!
    end
    result.each { |arr| @result << arr[0] }
    @result
  end

  private

  def searchall(trade)
    result = []
    trade = trade.to_i
    @trade_search = [trade]
    @search_locate_coordinates = Geocoder.search(params[:state]).first.coordinates
    @search_locate_display = "#{params[:state]}, Australia"
    profile = Trade.find(@trade_search.first).business_profiles.all
    profile.each { |p|
      if p.contact && check_membership(p)
        lat = p.contact.latitude
        lon = p.contact.longitude
        distance = Geocoder::Calculations.distance_between [lat, lon], @search_locate_coordinates
        rating = p.ratings.length > 0 ? get_average_star(p.ratings) : 0
        result.push([p, distance, rating]) if distance.to_f < 35
      end
    }
    return result
  end

  def get_average_star(rate)
    count = 0
    rate.each { |r|
      count = count + r.star_rating.to_f
    }
    return (count / rate.length).round(1)
  end

  def check_membership(profile)
    if profile.membership
      if profile.membership.end_date >= Date.today
        return true
      end
    end
    false
  end
end  #-----------class end
