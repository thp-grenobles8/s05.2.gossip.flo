class CitiesController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @city = City.find(params['id'])
    @id = params['id']
  end
end
