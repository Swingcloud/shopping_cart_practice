class Admin::CategoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin!

	def index
		@categories = Category.page(params[:page])
	end

	def new 
		@category = Category.new
	end

	def create
		@category = Category.new(category_params_permitted)
		if @category.save
			redirect_to admin_categories_path, notice: 'Created successfully!'
		else
			render :new
		end
	end

	def show 
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params_permitted)
			redirect_to admin_category_path(@category), notice: 'Updated successfully!'
		else
			render :edit
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to admin_categories_path, alert: 'Category was deleted successfully!'
	end


	private

	def authenticate_admin!
		redirect_to root_path, notice: 'You are not admin' unless current_user.admin?
	end

	def category_params_permitted
		params.require(:category).permit(:name, :description, :enabled)
	end
end
