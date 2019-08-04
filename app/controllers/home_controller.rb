class HomeController < ApplicationController
  def index

    tradie = GeoCoder::Calculations.distance_between(tradie_address, user_address)
    # tradie = BusinessProfile.find(:id)
    # tradie_near = Contact.near(:full_address, 10, units: :km)
    # raise
  end

  def search(tradie_address, user_address)

    # user_search_address = usa
    # tradie_listed_address = tla

    usa = user_search_params

    # For the tla we need to use .each to loop through each business_profile, look at the contact :full_address then
    # put the full_address into the Geocoder::Calculations method below

    tla = BusinessProfile

    search_sum = GeoCoder::Calculations.distance_between(usa, tla)

    # After the calculation above is done, we're going to need to pull from the business profiles contact table 
    # :travel_distance, then if the travel_distance is less than or equal to the 'search_sum' calc to push the business profile
    # on to an array.


    # Will then loop through an array to display 

    

  end

end
#<Contact id: 1, email: "spencerst@email.com", mobile_number: "0000 000 000", landline_number: "00 0000 0000", full_address: "120 Spencer Street, Melbourne VIC", created_at: "2019-07-29 06:40:08", updated_at: "2019-07-29 06:40:08", longitude: 144.9535707, latitude: -37.8178168>,