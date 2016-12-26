class Admin::OrdersController < Admin::BaseController
	before_action :find_order, only: %i(show edit update)
	def index 
		@orders = Order.page(params[:page])
	end

	def show
		@order_items = @order.order_items.includes(:product)
	end

	def edit 

	end

	def update
		if @order.update(order_params)
			@order.calculate_amount
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
		params.require(:order).permit(:name, :email, :mobile, :paid,
			order_items_attributes: [:quantity, :product_id, :price, :_destroy, :id]
		)
	end

end
