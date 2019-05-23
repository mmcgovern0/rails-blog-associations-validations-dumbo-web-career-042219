class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		set_user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		redirect_to @user
	end

	def edit
		set_user
	end

	def update
		set_user
		@user.update(user_params)
		redirect_to @user
	end

	def delete
		set_user
		@user.destroy
		redirect_to users_path
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:users).permit(:name)
	end
end
