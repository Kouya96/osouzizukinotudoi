class Public::ItemsController < ApplicationController
  before_action :ensure_guest_user, only: [:create]

  #オススメ商品一覧
  def index
    @items = Item.all
    @item = Item.new
    #byebug
  end

  def show
    @item = Item.find(params[:id])
    @item_new = Item.new
    #@item_comment = ItemComment.new
  end

  def new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to public_items_path, notice: "削除しました"
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to public_items_path, notice: "投稿が正常に完了しました"
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
      redirect_to public_item_path(@item), notice: "正常に更新しました"
    else
      render "edit"
    end
  end

  def seae
  end


  private

  def item_params
    params.require(:item).permit(:title, :body, :genre_id, :name, :star)
  end

  def ensure_correct_user
     @item = Item.find(params[:id])
     unless @item.user == current_user
      redirect_to item_path
     end
  end

  def ensure_guest_user
    @user = current_user
    if @user.last_name == "guestuser"
      redirect_to public_items_path , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
