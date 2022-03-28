class BooksController < ApplicationController


  def create

    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "successfully"
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update

    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:notice] = "successfully"
    else
      @user = @book.user
      @new_book = Book.new
      render :show
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
