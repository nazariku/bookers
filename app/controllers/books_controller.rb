class BooksController < ApplicationController
  def new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id)
    else
     render :index
    end
  end

  def index
    @book = Book.new
    
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
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
    
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
