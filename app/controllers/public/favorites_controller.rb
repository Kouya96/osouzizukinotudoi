class Public::FavoritesController < ApplicationController

  def create
   @item = Item.find(params[:item_id])
   @favorite = current_user.favorites.new(item_id: @item.id)
   @favorite.save
   render :replace_btn
  end

  def destroy
   @item = Item.find(params[:item_id])
   @favorite = current_user.favorites.find_by(item_id: @item.id)
   @favorite.destroy
   render :replace_btn
  end
end
