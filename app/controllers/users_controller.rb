class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    json = JSON.parse(params[:dados])
    @user = User.new(name: json["name"], cpf: json["cpf"], perfil_id: json["perfil"], password: json["password"])
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :cpf, :perfil, :password)
  end
end