class Admin::OrdersController < ApplicationController
  def show
    @oder = Oder.find(params[:id])
  end

  def update
  end
end
