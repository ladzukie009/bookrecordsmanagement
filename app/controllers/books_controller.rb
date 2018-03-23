class BooksController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

def index
  @books = Book.paginate(page: params[:page], per_page: 8).order('name ASC')
end


def show
  @book = Book.find_by(id:params[:id])
end

def new
  @book = Book.new
end

def create
  @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
end

def edit
  @book = Book.find_by(id:params[:id])
end

def update
  @book = Book.find_by(id:params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render 'edit'
    end
end

def destroy
  @book = Book.find_by(id:params[:id])
    if @book.destroy
      redirect_to books_path
    end
end

private
def book_params
  params.require(:book).permit(:name, :author_name, :year_published, :publisher)
end


end
