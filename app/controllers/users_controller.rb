class UsersController < ApplicationController
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
    @user = User.find(params['id'])
    @id = params['id']
  end
end
