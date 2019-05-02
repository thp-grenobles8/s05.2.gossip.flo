class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:login_email])

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
  if user && user.authenticate(params[:login_password])
    session[:user_id] = user.id
    # redirige où tu veux, avec un flash ou pas
    redirect_to user
  else
    flash[:warning_login] = 'Invalid email/password combination'
    render 'new'
  end
  end

  def destroy
    session.delete(:user_id)
  end
end
