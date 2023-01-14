class Public::ItemsController < ApplicationController
  
  #オススメ商品一覧
  def index
    @items = Item.all
    @item = Item.new
  end
  
  def show
  end
  
  def new
  end
  
  def destroy
  end
  
  def create
  end
  
  def edit
  end
  
  def update
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
