class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :destroy]
  before_action :user_is_author, only: [:edit, :destroy]

  def create
    @create_comment = Comment.new(
      author: current_user,
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

  private

  def user_is_author
    unless current_user == Comment.find(params[:id]).author
      flash[:not_author] = "Tu n'es pas l'auteur du commenntaire"
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  def authenticate_user
    unless current_user
      flash[:not_logged_in] = "Please log in."
      redirect_to new_session_path
    end
  end
end
