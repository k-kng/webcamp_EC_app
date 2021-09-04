class Public::CartItemsController < ApplicationController

 def index
  @cart_items = CartItem.all
 end

 def create
  @cart_item = current_customer.cart_items.new(params_cart_item)
  @cart_item.customer_id = current_customer.id
  @cart_item.save
  redirect_to cart_items_path
 end

 def update
 end

 def destroy
 end

 def all_destroy
 end

 private

  def params_cart_item
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
