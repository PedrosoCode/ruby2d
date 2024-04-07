class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to welcome_path, notice: "Login realizado com sucesso!"
    else
      # Mudança aqui: use flash e redirecione ao invés de renderizar
      flash[:alert] = 'Email ou senha inválidos'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: 'Logout realizado com sucesso!'
  end
end
