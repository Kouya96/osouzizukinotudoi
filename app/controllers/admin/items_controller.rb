class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
    @users = User.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
     redirect_to admin_items_path
  end


end