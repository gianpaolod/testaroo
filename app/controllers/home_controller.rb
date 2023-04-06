class HomeController < ApplicationController
  def index
    # código para mostrar la página de inicio con el formulario
  end

  def submit
    # obtener los datos del formulario
    user = User.new(
      name: params[:name],
      company: params[:company],
      email: params[:email],
      phone: params[:phone]
    )
  
    # validar los datos
    if user.valid?
      # si los datos son válidos, envía el correo electrónico y muestra un mensaje de éxito
      UserMailer.send_form(user.name, user.company, user.email, user.phone).deliver_now
      flash[:success] = 'Formulario enviado con éxito'
      redirect_to root_path
    else
      # si los datos no son válidos, muestra un mensaje de error con las validaciones fallidas
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end
end
end
