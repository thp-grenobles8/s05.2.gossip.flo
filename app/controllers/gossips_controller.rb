class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :destroy]
  before_action :user_is_author, only: [:edit, :destroy]

  def index
    @gossips = Gossip.all
  end

  def create
    @create_gossip = Gossip.new(
      content: params[:gossip_content],
      title: params[:gossip_title],
      user: current_user
    )
    if @create_gossip.save
      JoinTableGossipTag.create(tag_id: params[:tag_id], gossip: @create_gossip)
      flash[:notice] = "Post successfully created"
      redirect_to @create_gossip
    else
      flash[:warning] = "Le potin n'a pas pu être créer"
      redirect_to new_gossip_path
    end
  end

  def new
    @post = Gossip.new
  end

  def edit
    @edit_goss = Gossip.find(params['id'])
  end

  def show
    @is_liked = Like.find_by(gossip_id: params[:id], user: current_user) != nil
    @goss = Gossip.find(params['id'])
    @id = params['id']
  end

  def update
    @update_gossip = Gossip.find(params[:id])
    if @update_gossip.update(content: params[:gossip_content],
      title: params[:gossip_title],
      user_id: User.last.id
    )
      JoinTableGossipTag.create(tag_id: params[:tag_id], gossip: @update_gossip)
      flash[:update_success] = " Le potin a bien été mis à jour !"
      redirect_to @update_gossip
    else
      flash[:update_warning] = " Le potin n'a pas pu être mis à jour !"
      redirect_to @update_gossip
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:warning_delete] = "Le potin a été supprimé"
    redirect_to gossips_path
  end

  private

  def user_is_author
    unless current_user == Gossip.find(params[:id]).user
      flash[:not_author] = "Tu n'es pas l'auteur du potin"
      redirect_to gossip_path(params[:id])
    end
  end

  def authenticate_user
    unless current_user
      flash[:not_logged_in] = "Please log in."
      redirect_to new_session_path
    end
  end

end
