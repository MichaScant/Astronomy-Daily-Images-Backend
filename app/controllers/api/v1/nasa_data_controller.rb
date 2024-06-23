class Api::V1::NasaDataController < ApplicationController
  before_action only: [:destroy]

  #Get /faviourites
  def index
      @data = NasaData.all
      render json: @data
  end

  def show

        @ids = params[:id].split(",").map(&:to_i)

        @dataAll = []
        @ids.each{ |id|
            @data = nil;

            begin
                @data = NasaData.find(id);
            rescue ActiveRecord::RecordNotFound
                @data = {message: "Favourite does not exist"}
            end

            @dataAll.append({id: id, data: @data})

        }

        render json: @dataAll
  end

  def create
      @data = NasaData.new(data_params)
      if (@data.save)
          render json: @data
      else
          render error: {error: "Error occured, unable to add new favourite"}, status:400
      end
  end

  def update
    @data = NasaData.find(params[:id])
    if @data
        @data.update(nasa_data_params)
        render json: {message: 'update successful'}, status: 200
    else
      render json: {message: "update unsuccessful"}, status: 200
    end
  end

  def destroy
      @data = NasaData.find(params[:id])
      if (@data)
          @data.destroy
          render json: {message: "Removed Favourite"}, status:200
      else
          render json: {message: "Favourite does not exist"}, status:200
      end
  end

  private

  def data_params
      params.permit(:id, :date, :copyright, :explanation, :hdurl, :media_type, :service_version, :title, :url)
  end

end
