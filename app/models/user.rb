class User < ActiveRecord::Base
  has_secure_password validations: false

  validates_presence_of     :name, message: "O nome não pode ser vazio."
  validates_presence_of     :nickname, message: "O nome de usuário não pode ser vazio."
  validates_presence_of     :password, message: "A senha não pode ser vazio."
  validates_length_of       :nickname, :minimum => 3, message: "O nome de usuário precisa ter ao menos 3 letras." 
  validates_uniqueness_of   :nickname, message: "Já existe um nome de usuário igual a este, escolha outro."
  validates_confirmation_of :password, message: "A confirmação senha não pode ser vazio."
end
