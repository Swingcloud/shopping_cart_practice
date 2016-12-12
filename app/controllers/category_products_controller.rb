class CategoryProductsController < ApplicationController
	before_action :find_category

	def show
		@product = @category.products.active.find(params[:id].to_i)
		viewed_at = cookies["view-product-#{@product.id}"].to_i
		puts viewed_at
		@viewed = viewed_at > @product.updated_at.to_i
		cookies["view-product-#{@product.id}"] = Time.now.to_i unless @viewed
	end

	def add
		@product = @category.products.active.find(params[:id].to_i)
		@cart = find_cart
		@cart.add_item(@product)
		session[:cart_id] = @cart.id
		redirect_back fallback_location: category_product_path(@product.category, @product)  , notice: '購物車已變更！'
	end

	private

	# Check it in`rails routes`
  # category_product GET /categories/:category_id/products/:id(.:format) category_products#show
 	def find_category
 		@category = Category.enabled.find(params[:category_id])
 	end

 	def find_cart
 		if session[:cart_id]
 			Cart.find_by(id: session[:cart_id]) || Cart.new
 		else
 			Cart.new
 		end
 	end
end
