class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save!
    redirect_to items_url, notice: "「#{item.item_name}」を登録しました。"
  end

  def edit
    @task = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update!(item_params)
    redirect_to items_url, notice: "「#{item.item_name}」を更新しました。"
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :category, :description, :price, :bought_at)
  end
end
