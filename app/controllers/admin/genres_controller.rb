class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "ジャンル作成が正常に完了しました"
    else
      @genres = Genre.all
      @genre = Genre.new
      render 'index'
    end
  end
   
   
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path, notice: "ジャンルを削除しました"
  end
   


   private

  def genre_params
    params.require(:genre).permit(:name)
  end


end
