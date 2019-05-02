class UsersController < ApplicationController
  def new
    @new_user = User.new
  end

  def create
    if City.where(name: params[:user_city] ).length.zero?
      @new_city = City.create(name: params[:user_city])
    end
    @create_user = User.new(
      last_name: params[:user_last_name],
      first_name: params[:user_first_name],
      email: params[:user_email],
      city_id: City.find_by(name: params[:user_city]).id,
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @create_user.save
      flash[:success_create_user] = "Welcome #{@create_user.last_name}"
      redirect_to @create_user
    else
      flash[:warning_create_user] = "Le compte n'a pas pu être créer"
        @gossip.errors.full_messages.each do |message|
          puts message
        end
      redirect_to new_user_path
    end
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
