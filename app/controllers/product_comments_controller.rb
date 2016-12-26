class ProductCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		product = Product.active.find(params[:product_id])
		comment = current_user.comments.new(commentable: product)
		comment.attributes = comment_params

		if comment.save
			redirect_back fallback_location: category_product_path(product.category, product)  , notice: '評論已發表！'
		else
			redirect_back fallback_location: category_product_path(product.category, product) , alert: comment.errors.full_messages.to_sentence
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:name, :content)
	end
end
