class UsersController < Clearance::UsersController

  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    nome = user_params.delete(:nome)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.nome = nome
    end
  end

end