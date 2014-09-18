class FansController < ApplicationController
  before_action :set_fan, only: [:show, :edit, :update, :destroy]

  # GET /fans
  # GET /fans.json
  def index
    @fans = Fan.all
  end

  # GET /fans/1
  # GET /fans/1.json
  def show
  end

  # GET /fans/new
  def new
    @fan = Fan.new
  end

  # GET /fans/1/edit
  def edit
  end

  # POST /fans
  # POST /fans.json
  def create
    @fan = Fan.new(fan_params)

    respond_to do |format|
      if @fan.save
        FanMailer.welcome(@fan.id).deliver
        format.html { redirect_to @fan, notice: 'Fan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fan }
      else
        format.html { render action: 'new' }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fans/1
  # PATCH/PUT /fans/1.json
  def update
    respond_to do |format|
      if @fan.update(fan_params)
        format.html { redirect_to @fan, notice: 'Fan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fans/1
  # DELETE /fans/1.json
  def destroy
    @fan.destroy
    respond_to do |format|
      format.html { redirect_to fans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fan
      @fan = Fan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fan_params
      params.require(:fan).permit(:email)
    end
end
