class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :set_user,      only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "ようこそ、#{@user.name}さん！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
   # @user は set_user で current_user をセット済み
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "プロフィールを更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end