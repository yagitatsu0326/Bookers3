class UsersController < ApplicationController
	before_action :authenticate_user!
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)

	end
	def show
		@user = User.find(params[:id])
		@user_info = @user
		@book_new = Book.new
		@book = @user.books
	end
	def index
		#@user_info =User.find(params[:id])
		#@book_new =Book.new
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end
	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)

	end
end
