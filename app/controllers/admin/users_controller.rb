class Admin::UsersController < Admin::BaseController
	
	def index
		@users = User.page(params[:page])
	end

	def new
		@user= User.new
	end

	def create 
		@user= User.new(user_params_permitted)
		if @user.save
			redirect_to admin_user_path(@user), notice: 'created successfully!'
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit 
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params_permitted)
			redirect_to admin_user_path(@user), notice: 'Edited successfully!'
		else
			render :edit 
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admin_users_path, alert: 'User was destroyed succesfully!'
	end

	private

	def user_params_permitted
		params.require(:user).permit(:email, :password, :password_confirmation, :admin)
	end

end
