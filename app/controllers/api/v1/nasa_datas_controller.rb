class Api::V1::NasaDatasController < ApplicationController
  before_action :find_nasaData, only: [:destroy]

  #Get /faviourites
  def index
      @data = UsersNasaDataObject.all
      render json: @data
  end

  def show
      @data = UsersNasaDataObject.find(params[:id])
      render json: @data
  end

  def create
      @data = UsersNasaDataObject.new(data_params)
      puts "TEST"
      puts @data
      if (@data.save)
          render json: @data
      else
          render error: {error: "Error occured, unable to add new favourite"}, status:400
      end
  end

  def update
    @data = UsersNasaDataObject.find(params[:id])
    if @data
        @data.update(nasa_data_params)
        render json: {message: 'update successful'}, status: 200
    else
      render error: {error: "Error occured, unable to add new favourite"}, status:400
    end
  end

  def destroyd
      @data = UsersNasaDataObject.find(params[:id])
      if (@data)
          @data.destroy
          render json: {message: "Removed Favourite"}, status:200
      else
          render error: {error: "Error occured, unable to add new favourite"}, status:400
      end
  end

  private

  def data_params
      params.require(:UsersNasaDataObject).permit(:id, :copyright, :explanation, :hdurl, :media_type, :service_version, :title, :url)
  end

end
