class CategoryCommentsController < ApplicationController
	before_action :authenticate_user!

	def create 
		category = Category.enabled.find(params[:category_id])
		comment = current_user.comments.new(commentable: category)
		comment.attributes = comment_params

		if comment.save 
			redirect_back fallback_location: category_path(category), notice: '評論已發表！'
		else
			redirect_back fallback_location: category_path(category), alert: comment.errors.full_messages.to_sentece
		end	
	end

	private

	def comment_params
		params.require(:comment).permit(:name, :content)
	end
end
