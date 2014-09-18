class RappersController < ApplicationController
  before_action :set_rapper, only: [:show, :edit, :update, :destroy]

  # GET /rappers
  # GET /rappers.json
  def index
    @rappers = Rapper.all
  end

  # GET /rappers/1
  # GET /rappers/1.json
  def show
  end

  # GET /rappers/new
  def new
    @rapper = Rapper.new
  end

  # GET /rappers/1/edit
  def edit
  end

  # POST /rappers
  # POST /rappers.json
  def create
    @rapper = Rapper.new(rapper_params)

    respond_to do |format|
      if @rapper.save
        format.html { redirect_to @rapper, notice: 'Rapper was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rapper }
      else
        format.html { render action: 'new' }
        format.json { render json: @rapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rappers/1
  # PATCH/PUT /rappers/1.json
  def update
    respond_to do |format|
      if @rapper.update(rapper_params)
        format.html { redirect_to @rapper, notice: 'Rapper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rappers/1
  # DELETE /rappers/1.json
  def destroy
    @rapper.destroy
    respond_to do |format|
      format.html { redirect_to rappers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rapper
      @rapper = Rapper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rapper_params
      params.require(:rapper).permit(:name, :age)
    end
end
