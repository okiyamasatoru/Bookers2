class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show

    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new


  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update

    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
      flash[:notice] = "successfully"
    else
      render :edit
    end
  end
  def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "successfully"
    else
      @books = Book.all
      render :index
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
