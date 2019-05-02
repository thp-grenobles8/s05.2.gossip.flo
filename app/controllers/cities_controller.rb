class CitiesController < ApplicationController

  def show
    @city = City.find(params['id'])
    @id = params['id']
  end
end
