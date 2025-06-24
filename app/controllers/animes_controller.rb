class AnimesController < ApplicationController
  before_action :require_login
  before_action :set_anime, only: [:show, :edit, :update, :destroy]
  
  def index
    @animes = current_user.animes
  end

  def new
    @anime = Anime.new
  end

  def create
    @anime = current_user.animes.build(anime_params)
    if @anime.save
      redirect_to animes_path, notice: "アニメを登録しました！"
    else
    render :new, status: :unprocessable_entity
    end
  end

  def show
    @anime = current_user.animes.find(params[:id])
  end

  def edit
  end

  def update
    if @anime.update(anime_params)
      redirect_to anime_path(@anime),notice: "アニメを更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @anime.destroy
    redirect_to animes_path, notice: "アニメを削除しました！"
  end


  private

  def set_anime
    @anime = current_user.animes.find(params[:id])
  end

  def anime_params
    params.require(:anime).permit(:title, :description, :genre, :status)
  end

end
