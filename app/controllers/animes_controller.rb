class AnimesController < ApplicationController
  before_action :require_login

  def new
    @anime = Anime.new
  end

  def create
    @anime = current_user.animes.build(anime_params)
    if @anime.save
      redirect_to root_path, notice: "アニメを登録しました！"
    else
    render :new, status: :unprocessable_entity
    end
  end

  private

  def anime_params
    params.require(:anime).permit(:title, :description, :genre, :status)
  end

end
