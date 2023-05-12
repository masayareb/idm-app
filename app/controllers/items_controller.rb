class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index 
    @items = Item.order(purchase_date: :asc)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create 
    @item = Item.create(item_params)
    if  @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :item, :status_id, :manufacturer, :serial_number, :ip, :purchase_date, :years_of_use,:remarks).merge(user_id: current_user.id)
   end
end
