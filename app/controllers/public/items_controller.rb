class Public::ItemsController < ApplicationController

  #オススメ商品一覧
  def index
    @items = Item.all
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @item_new = Item.new
    @item_comment = ItemComment.new
  end

  def new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: "successfully delete book!"
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to public_item_path(@item), notice: "You have created book successfully."
    else
      @items = Item.all
      render 'index'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to public_item_path(@item), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def seae
  end


  private

  def item_params
    params.require(:item).permit(:title, :body)
  end



  def ensure_correct_user
     @item = Item.find(params[:id])
     unless @item.user == current_user
      redirect_to item_path
     end
  end
end
