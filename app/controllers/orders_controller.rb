class OrdersController < ApplicationController

  before_filter :authenticate 
  require 'csv'

  def authenticate
    @user = current_user
    redirect_to(root_path) unless @user and @user.admin == true
  end

  def index
    @orders = Order.order(:id)
    respond_to do |format|
      format.html
      format.csv { send_data @orders.to_csv }
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def open_orders
    @orders = Order.find(:all, :conditions => { :status => 'Order Placed' })
    respond_to do |format|
      format.html
      format.csv { send_data @orders.to_csv }
    end
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:order])

      if @order.save
        redirect_to @order, notice: 'Order was successfully created.'
      else
        render action: "new"
      end
    end

  def update
    @order = Order.find(params[:id])

      if @order.update_attributes(params[:order])
        redirect_to @order, notice: 'Order was successfully updated.'
      else
        render action: "edit"
      end
  end

  def destroy
    @order.destroy
    redirect_to orders_url
  end

  def ship_order
    @order = Order.find(params[:id])
    @order.status = "Order Shipped"
    @order.save
    redirect_to :back
  end

  def unship_order
    @order = Order.find(params[:id])
    @order.status = "Order Placed"
    @order.save
    redirect_to :back
  end

  def new_shipment
    #
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:id, :status, :user_id, :label, :shipment_id)
    end
  
end
