class Api::V1::FavouritesController < ApplicationController
  before_action :find_favourites, only: [:show, :update, :destroy]

  #GET /favourites
  def index
      @favourites = Favourite.all
      render json: @favourites
  end

  # GET /favourites/:id
  def show
      render json: @favourite
  end

  #POST
  def create
      @favourite = Favourite.new(user_params)
      if (@favourite.save)
          render json: @favourite
      else
          render error: {error: "Error occured, unable to add new favourite"}, status:400
      end
  end

  # PUT /favourites/:id
  def update
      @favourite = Favourite.find(params[:id])
      if @favourite
          @favourite.update(user_params)
          render json: {message: 'update successful'}, status: 200
      else
        render error: {error: "Error occured, unable to add new favourite"}, status:400
      end
  end

  def destroy
      @favourite = Favourite.find(params[:id])
      if @favourite
          @favourite.destroy
          render json: {message: "Removed Favourite"}, status: 200
      else
          render error: {error: "Error occured, unable to add new favourite"}, status:400
      end
  end

  private

  def favourites_params
      params.require(:Favourite).permit(:nasadata_id, :showDescription, :likes, :liked)
  end


  def find_favourites
      @favourite = Favourite.find(params[:id])
  end

end
