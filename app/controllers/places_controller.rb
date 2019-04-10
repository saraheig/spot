class PlacesController < InheritedResources::Base

  private

    def place_params
      params.require(:place).permit(:title, :description, :price, :duration, :schedule, :lat, :lng)
    end

end
