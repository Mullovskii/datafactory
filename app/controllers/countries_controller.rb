class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy, :buys_from, :internal_turnover, :foreign_buyers, :payment_systems, :buys_from_countries]

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.paginate(:page => params[:page], :per_page => 30).order("sales_region ASC")
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    @websites = Website.where(country_id: @country.id).order("monthly_visits DESC")
  end

  def buys_from
    # @websites = @country.websites.where.not(country_id: @country.id).order("monthly_visits DESC")
    @traffics = @country.traffics.where(country_id: @country.id).order("country_visits DESC").where.not(website_id: Website.where(country_id: @country.id))
  end

  def buys_from_countries
    # @websites = @country.websites.where.not(country_id: @country.id).order("monthly_visits DESC")
    @inflows = Inflow.where(importer_country_id: @country.id).order("annual_turnover DESC")
  end

  def foreign_buyers
      @inflows = Inflow.where(exporter_country_id: @country.id).order("annual_turnover DESC")
  end

  def internal_turnover
    @traffics = @country.traffics.where(country_id: @country.id, mother_country_id: @country.id).order("country_visits DESC")
  end

  def payment_systems
    @system = System.new
    @habbit = Habbit.new
    @habbits = @country.habbits
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :sales_region, :importer_region, :market_volume, :users, :shoppers, :game_market, :description)
    end
end
