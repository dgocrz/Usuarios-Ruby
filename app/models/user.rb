#Se crea el modelo de Usuario con el metodo has_secure_password para la validación
class User < ApplicationRecord

    has_secure_password

    validates:name, presence:true
    validates:email, presence:true, uniqueness:true

end
