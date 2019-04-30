class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    #
  end

  def create
    @create_gossip = Gossip.new(
      content: params[:gossip_content],
      title: params[:gossip_title],
      user_id: User.last.id
    )
    if @create_gossip.save
      flash[:notice] = "Post successfully created"
      redirect_to @create_gossip
    else
      flash[:warning] = "Gossip don't created"
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
      redirect_to @update_gossip
    else
      render :edit
    end
  end

  def destroy
    #
    #
  end
end
