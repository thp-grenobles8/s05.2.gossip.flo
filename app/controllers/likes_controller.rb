class LikesController < ApplicationController
  before_action :authenticate_user, only: [:update, :create, :destroy]

  def create
    Like.create(user: current_user, gossip_id: params[:gossip_id])
    redirect_to request.referrer
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to request.referrer
  end

  private

  def authenticate_user
    unless current_user
      flash[:not_logged_in] = "Please log in."
      redirect_to new_session_path
    end
  end
end
