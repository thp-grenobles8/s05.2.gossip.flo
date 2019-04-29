class DynamicPageController < ApplicationController

  def show_gossip
    @goss = Gossip.find(params['id'])
    @id = params['id']
  end

  def show_user
    @user = User.find(params['id'])
    @id = params['id']
  end
end
