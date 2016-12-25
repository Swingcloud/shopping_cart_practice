class Admin::OrdersController < Admin::BaseController
	before_action :find_order, only: %i(show edit update)
	def index 
		@orders = Order.page(params[:page])
	end

	def show
		
	end

	def edit 

	end

	def update
		if @order.update(order_params)
			redirect_to admin_order_path(@order), notice: 'Updated Successfully!'
		else
			render :edit
		end
	end

	private

	def find_order
		@order = Order.find(params[:id])
	end

	def order_params
		params.require(:order).permit(:name, :email, :mobile, :paid)
	end

end
