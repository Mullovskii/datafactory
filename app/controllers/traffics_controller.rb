class TrafficsController < ApplicationController
  before_action :set_traffic, only: [:show, :edit, :update, :destroy]

  # GET /traffics
  # GET /traffics.json
  def index
    @traffics = Traffic.all
  end

  # GET /traffics/1
  # GET /traffics/1.json
  def show
  end

  # GET /traffics/new
  def new
    @traffic = Traffic.new
  end

  # GET /traffics/1/edit
  def edit
  end

  # POST /traffics
  # POST /traffics.json
  def create
    @traffic = Traffic.new(traffic_params)

    respond_to do |format|
      if @traffic.save
        format.html { redirect_to @traffic.website, notice: 'Traffic was successfully created.' }
        format.json { render :show, status: :created, location: @traffic }
      else
        format.html { render :new }
        format.json { render json: @traffic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traffics/1
  # PATCH/PUT /traffics/1.json
  def update
    respond_to do |format|
      if @traffic.update(traffic_params)
        format.html { redirect_to @traffic.website, notice: 'Traffic was successfully updated.' }
        format.json { render :show, status: :ok, location: @traffic }
      else
        format.html { render :edit }
        format.json { render json: @traffic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traffics/1
  # DELETE /traffics/1.json
  def destroy
    @traffic.destroy
    respond_to do |format|
      format.html { redirect_to @traffic.website, notice: 'Traffic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traffic
      @traffic = Traffic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def traffic_params
      params.require(:traffic).permit(:country_id, :website_id, :country_share, :country_visits, :bounce_rate, :country_visitors, :annual_turnover)
    end
end
