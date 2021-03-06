class HabbitsController < ApplicationController
  before_action :set_habbit, only: [:show, :edit, :update, :destroy]

  # GET /habbits
  # GET /habbits.json
  def index
    @habbits = Habbit.all
  end

  # GET /habbits/1
  # GET /habbits/1.json
  def show
  end

  # GET /habbits/new
  def new
    @habbit = Habbit.new
  end

  # GET /habbits/1/edit
  def edit
  end

  # POST /habbits
  # POST /habbits.json
  def create
    @habbit = Habbit.new(habbit_params)

    respond_to do |format|
      if @habbit.save
        format.html { redirect_to payment_systems_country_path(@habbit.country), notice: 'Habbit was successfully created.' }
        format.json { render :show, status: :created, location: @habbit }
      else
        format.html { render :new }
        format.json { render json: @habbit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habbits/1
  # PATCH/PUT /habbits/1.json
  def update
    respond_to do |format|
      if @habbit.update(habbit_params)
        format.html { redirect_to @habbit, notice: 'Habbit was successfully updated.' }
        format.json { render :show, status: :ok, location: @habbit }
      else
        format.html { render :edit }
        format.json { render json: @habbit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habbits/1
  # DELETE /habbits/1.json
  def destroy
    @habbit.destroy
    respond_to do |format|
      format.html { redirect_to habbits_url, notice: 'Habbit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habbit
      @habbit = Habbit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habbit_params
      params.require(:habbit).permit(:country_id, :system_id, :share, :description)
    end
end
