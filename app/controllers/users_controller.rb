class UsersController < ApplicationController
  def index


  end

  def new
    #Se crea un nuevo usuario
    @user = User.new
  end

  def show
    #mostramos los parametros ligados al usuario correo, nombre o contraseña
    @user = User.find(params[:id])
  end

  def create

   
    @user =User.new(user_params)

    #Comprobamos la creación del usuario 

    if @user.save
      redirect_to @user, notice: "Usuario creado con exito"
    else
      render:new,status: :unprocessable_entity 
    end
  end

  def user_params
    #Se solicitan los  parametros del usuario como nombre, email y contraseña 

    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def search
  end
end
