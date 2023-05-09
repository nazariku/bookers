class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    #findメソッドは引数を受け取り、idカラムを引数と比べてレコードを取得してくるメソッド
  end

  def edit
    @book = Book.find(params[:id])#この文を追加した際に上のendの後にスペースがあってエラーが出た
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
    
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
