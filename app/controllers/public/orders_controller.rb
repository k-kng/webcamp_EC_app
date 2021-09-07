class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @shipping_addresses = ShippingAddress.all
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

end
