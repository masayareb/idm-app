class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index,:search ]
  before_action :set_item, only: [:edit, :show, :update]

  def index 
    @items = Item.order(purchase_date: :asc)
  end

  def new
    @item = Item.new
  end

  def show
  end
  
  def create 
    @item = Item.create(item_params)
    if  @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :item, :status_id, :manufacturer, :serial_number, :ip, :purchase_date, :years_of_use,:remarks).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
