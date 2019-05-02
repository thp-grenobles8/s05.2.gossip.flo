class CommentsController < ApplicationController
  def new
  end

  def index
  end

  def create
    @create_comment = Comment.new(
      author: User.all.sample,
      gossip: Gossip.find_by_id(params[:id]),
      content: params[:comment_content]
    )
    if @create_comment.save
      flash[:comment_online] = "Le commentaire a été publié"
      redirect_to gossip_path(params[:id])
    else
      flash[:warning_comment] = "Le commentaire n'a pas pu être publié"
      redirect_to @create_comment.gossip
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @path = @comment.gossip
    @comment.destroy
    flash[:warning_delete_commentaire] = "Le commentaire a été supprimé"
    redirect_to @path
  end

  def update
    @update_comment = Comment.find(params[:id])
    if @update_comment.update(content: params[:gossip_content])
      flash[:update_comment] = " Le commentaire a bien été mis à jour !"
      redirect_to @update_comment.gossip
    else
      flash[:update_comment_warning] = " Le commentaire n'a pas pu être mis à jour !"
      render :edit
    end
  end

  def edit
    @edit_comm = Comment.find(params['id'])
  end

  def show
  end
end
