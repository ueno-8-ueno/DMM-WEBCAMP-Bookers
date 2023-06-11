class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    #保存できたら
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    #保存できなかったら
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.new(book_params)
    # ↓バリデーションが通った
    if @book.valid?
      @book = Book.find(params[:id])
      @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    # ↓バリデーションエラー発生
    else
      @book = Book.find(params[:id])
      @book.update(book_params)
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end




  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
