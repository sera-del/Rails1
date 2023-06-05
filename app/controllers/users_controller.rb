class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
   @user = User.new
  end

  def create
   @user = User.new(params.require(:user).permit(:title, :start_date, :end_date, :is_all_day, :memo))
   if @user.save
    flash[:notice] = "スケジュールを登録しました"
    redirect_to :users
   else
    flash[:notice2] = "スケジュールの登録に失敗しました"
    render "new", status: :unprocessable_entity
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
   if @user.update(params.require(:user).permit(:title, :start_date, :end_date, :is_all_day, :memo))
    flash[:notice] = "予定IDが「#{@user.id}」のスケジュールを更新しました"
    redirect_to :users
   else
    flash[:notice3] = "スケジュールの更新に失敗しました"
    render "edit", status: :unprocessable_entity
   end
  end

  def destroy
   @user = User.find(params[:id])
   @user.destroy
   flash[:notice] = "予定を削除しました"
   redirect_to :users, status: :see_other
  end

end

