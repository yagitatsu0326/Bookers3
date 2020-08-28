class BooksController < ApplicationController
	before_action :authenticate_user!
	def new
		@book = Book.new
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:create] ="いい投稿作りましたね!!"
			redirect_to book_path(@book.id)
		else
			@user = current_user
			@books = Book.all
			render :index
		end
	end
	def show
		@book = Book.new
		@books = Book.find(params[:id])
		@user = @books.user
	end
	def index
		@user = current_user
		@book = Book.new
		@books = Book.all
	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		   flash[:update] ="投稿更新しましたよ!!"
		   redirect_to book_path(@book.id)
		else
			render :edit
		end
	end
	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
