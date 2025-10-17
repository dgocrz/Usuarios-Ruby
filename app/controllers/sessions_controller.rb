class SessionsController < ApplicationController
  def new
  end

  def create
    #Verificamos que el usuario exista y que tambien su contraseña sea correcta
    user= User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to,notice:"Se ha iniciado sesión"
    #En caso de que no entonces enviamos una alerta
    else
      #Despliega un mensaje de alerta para el usuario
      flash.now[:alert] ="Email o contraseña incorrectos (intenta de nuevo)"
      render:new,status: :unprocessable_entity

  end

  def destroy

    session[:user_id] = nil
    redirect_to login_path, notice:"Sesion terminada"
  end
end
