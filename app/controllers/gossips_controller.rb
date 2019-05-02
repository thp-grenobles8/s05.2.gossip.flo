class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def create
    @create_gossip = Gossip.new(
      content: params[:gossip_content],
      title: params[:gossip_title],
      user_id: User.last.id
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


end
