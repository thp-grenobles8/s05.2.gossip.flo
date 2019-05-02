module LikesHelper
  def is_like?(id_gossip)
    Like.find_by(gossip_id: id_gossip, user: current_user)
  end

  def how_likes(id_gossip)
    Like.where(gossip_id: id_gossip).length
  end
end
