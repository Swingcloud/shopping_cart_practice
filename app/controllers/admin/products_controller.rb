class Admin::ProductsController < Admin::BaseController
	def index
		@products = Product.page(params[:page])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params_permitted)
		if @product.save
			redirect_to admin_product_path(@product), notice: 'Created successfully!'
		else
			render :new 
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit 
		@product = Product.find(params[:id])
	end

	def upadate
		@product = Product.find(params[:id])
		if @product.update(product_params_permitted)
			redirect_to admin_product_path(@product), notice: 'Edited successfully!'
		else 
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admin_products_path, alert: 'Product was deleted successfully!'
	end

	private

	def product_params_permitted
		parmas.require(:product).permit(:name, :description, :content, :active, :price, :category_id)
	end
end
