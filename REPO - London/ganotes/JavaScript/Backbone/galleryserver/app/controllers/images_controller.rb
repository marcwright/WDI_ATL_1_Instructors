class ImagesController < ApplicationController
  respond_to :json

  def show
    @image = Image.find params[:id]
    respond_with @image
  end

  def create
    @image = Image.new params[:image]
    if @image.save
      respond_with @image
    else
      respond_with @image, :status => :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find params[:id]
    if @image.destroy
      respond_with :status => :no_content
    else
      respond_with @image, :status => :internal_server_error
    end
  end
end
