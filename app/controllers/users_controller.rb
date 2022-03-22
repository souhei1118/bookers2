class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!

  def index
    @user = current_user
    @book = Book.new
    @users =User.all
  end

  def show
    @user = current_user
    @book = Book.new
    @users = User.find(params[:id])
    @books = @users.books.all
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     redirect_to user_path(@user.id),notice: 'You have updated user successfully.'
   else
     render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  private
  def correct_user
     user = User.find(params[:id])
    if current_user != user
       redirect_to users_path
    end
  end
end