class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @shipping_addresses = ShippingAddress.all
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total_price = 0
    @order = Order.new(order_params)
    case params[:select_address]
    when "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to thanks_orders_path
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    OrderItem.create(
     item: cart_item.item,
     order: @order,
     amount: cart_item.amount,
     sub_total: cart_item.item.add_tax_price)
    end
    @cart_items.destroy_all
  end

  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_amount)
  end

end
