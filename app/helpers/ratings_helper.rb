module RatingsHelper
  def get_stars(stars)
    star = fa_icon("star")
    return_star = fa_icon("star")
    (1..stars - 1).each {
      return_star += star
    }
    return return_star
  end

  def get_average_star(rate)
    count = 0
    rate.each { |r|
      count = count + r.star_rating.to_f
    }
    return (count / rate.length).round(1).to_s + " stars"
  end
end
