class SessionsController < ApplicationController
  def new
  end


  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      duvida por que não funciona e como funcionaria com redirect_to user_contacts_path(current_user)
      redirect_to  contacts_path(current_user)
    else
      flash.now[:danger] = 'Email e Senha inválidos'
      render 'new'
    end
  end


  def destroy
    sign_out
    flash[:warning] = 'Logout realizado com sucesso'
    redirect_to entrar_path
  end

end
