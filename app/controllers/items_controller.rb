require 'csv'

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index,:search ]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :check_admin, only: [:import, :import_page]

  def index 
    @items = Item.order(purchase_date: :asc)
  end

  def new
    @item = Item.new
  end

  def show
  end
  
  def create 
    employee_number = params[:item][:employee_number]
    user = User.find_by(employee_number: employee_number)
    @item = Item.new(item_params)
    @item.user = user
    if  @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  
  def edit
    @employee_number = @item.user.employee_number
    unless @item.user_id == current_user.id || current_user&.admin?
      redirect_to root_path
    end
  end

  def update
    employee_number = params[:item][:employee_number]
    user = User.find_by(employee_number: employee_number)
    @item.user = user
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end


  def search
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  #csv取り込み
  def import
    # fileはtmpに自動で一時保存される
    flash[:alert] = Item.import(params[:file])
    redirect_to import_page_items_path
  end

  def import_page
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :item, :status_id, :manufacturer, :serial_number, :ip, :purchase_date, :years_of_use,:remarks)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_admin
    unless current_user&.admin?
      redirect_to root_path
    end
  end

  
end
