class MemesController < ApplicationController
  def show
    @meme = Meme.find(params[:id])
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = Meme.new(meme_params)
    if @meme.save
      flash[:success] = "Meme created successfully!"
      redirect_to @meme
    else
      render 'new'
    end
  end

  
  private

  def meme_params
    params.require(:meme).permit(:title, :top_text, :bottom_text, :url)
  end
end
