class ItemsController < ApplicationController
  before_action :login_required, only: [:index, :edit, :update, :new, :create]

  def index
    @items = current_user.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(item_params)
    
    if @item.save
      redirect_to @item, notice: "「#{@item.item_name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_url, notice: "「#{@item.item_name}」を更新しました。"
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :category, :description, :price, :bought_at)
  end
end