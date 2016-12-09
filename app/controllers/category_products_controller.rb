class CategoryProductsController < ApplicationController
	before_action :find_category

	def show
		@product = @category.products.where(active: true).find(params[:id].to_i)
		viewed_at = cookies["view-product-#{@product.id}"].to_i
		puts viewed_at
		@viewed = viewed_at > @product.updated_at.to_i
		cookies["view-product-#{@product.id}"] = Time.now.to_i unless @viewed
	end

	private

	# Check it in`rails routes`
  # category_product GET /categories/:category_id/products/:id(.:format) category_products#show
 	def find_category
 		@category = Category.where(enabled: true).find(params[:category_id])
 	end
end
