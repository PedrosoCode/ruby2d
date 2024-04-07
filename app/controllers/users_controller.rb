class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Após o cadastro, você pode querer logar o usuário automaticamente
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Conta criada com sucesso!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
