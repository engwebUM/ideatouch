class UsersController < Clearance::UsersController
  before_action :set_user, only: :show
  
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
    Notification.create :user_id => @user.id , :text => "Hi #{@user.nome} . Welcome to IDeaTouch." , :estado => false
  end


  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    nome = user_params.delete(:nome)

    clearance_configuration(email, password, nome)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def clearance_configuration(email, password, nome)
    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.nome = nome
    end
    
  end
end

