class Public::CartItemsController < ApplicationController

 def index
  @cart_items = current_customer.cart_items
  @total_price = 0
 end

 def create
  @cart_item = current_customer.cart_items.new(params_cart_item)
  @cart_item.customer_id = current_customer.id
  @update_cart_item =  CartItem.find_by(item: @cart_item.item)
  if @update_cart_item.present? && @cart_item.valid?
   @cart_item.amount += @update_cart_item.amount
   @update_cart_item.destroy
  end
  @cart_item.save
  redirect_to cart_items_path
 end

 def update
  cart_item = CartItem.find(params[:id])
  cart_item.update!(cart_item_params)
  redirect_to cart_items_path
 end

 def destroy
  cart_item = CartItem.find(params[:id])
  cart_item.destroy
  redirect_to cart_items_path
 end

 def all_destroy
  @cart_item = current_customer.cart_items
  current_customer.cart_items.destroy_all
  redirect_to cart_items_path
 end

 private

  def params_cart_item
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
