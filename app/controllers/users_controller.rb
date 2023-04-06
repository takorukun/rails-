class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :startDate, :endDate, :allDay, :memo))
    if @user.save
      flash[:alert] = "スケジュールを登録しました"
      redirect_to :users
    else
      flash[:alert] = "スケジュールを登録に失敗しました"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title,:startDate,:endDate,:allDay,:memo))
      flash[:alert] = "スケジュールを更新しました"
      redirect_to :users
    else
      flash[:alert] = "スケジュールの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :users
  end
end
