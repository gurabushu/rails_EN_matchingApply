class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
  
  def show
    @user_skills = @user.skills.split(",") if @user.skills.present? 
  end

  def edit
    redirect_to root_path unless @user == current_user
  end

  def update
    redirect_to root_path unless @user == current_user
    
    if @user.update(user_params)
      redirect_to @user, notice: "プロフィールを更新しました"
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path unless @user == current_user
    
    @user.destroy
    redirect_to root_path, notice: "アカウントを削除しました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :img_url, :introduction, :skills, :age)
  end
end