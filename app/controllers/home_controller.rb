class HomeController < ApplicationController

    def index
        tradie = BusinessProfile.find(id)
        tradie_near = Contact.near(tradiefull_address, 10, units: :km)
        raise
    end

end
