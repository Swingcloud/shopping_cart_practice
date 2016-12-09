class Admin::ProductsController < Admin::BaseController
	before_action :find_product, only: %i(show edit update destroy)

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
	end

	def edit 
	end

	def update
		if @product.update(product_params_permitted)
			redirect_to admin_product_path(@product), notice: 'Edited successfully!'
		else 
			render :edit
		end
	end

	def destroy
		@product.destroy
		redirect_to admin_products_path, alert: 'Product was deleted successfully!'
	end

	private

	def find_product
		@product = Product.find(params[:id].to_i)
	end

	def product_params_permitted
		params.require(:product).permit(:name, :description, :content, :active, :price, :category_id, :friendly_id, :shelved_on)
	end
end
