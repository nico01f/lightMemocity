class MemocitiesController < ApplicationController
  before_action :set_memocity, only: [:show, :edit, :update, :destroy]

  # GET /memocities
  # GET /memocities.json
  def index
    @memocities = Memocity.all
  end

  # GET /memocities/1
  # GET /memocities/1.json
  def show
  end

  # GET /memocities/new
  def new
    @memocity = Memocity.new
  end

  # GET /memocities/1/edit
  def edit
  end

  # POST /memocities
  # POST /memocities.json
  def create
    @memocity = Memocity.new(memocity_params)

    respond_to do |format|
      if @memocity.save
        format.html { redirect_to @memocity, notice: 'Memocity was successfully created.' }
        format.json { render :show, status: :created, location: @memocity }
      else
        format.html { render :new }
        format.json { render json: @memocity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memocities/1
  # PATCH/PUT /memocities/1.json
  def update
    respond_to do |format|
      if @memocity.update(memocity_params)
        format.html { redirect_to @memocity, notice: 'Memocity was successfully updated.' }
        format.json { render :show, status: :ok, location: @memocity }
      else
        format.html { render :edit }
        format.json { render json: @memocity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memocities/1
  # DELETE /memocities/1.json
  def destroy
    @memocity.destroy
    respond_to do |format|
      format.html { redirect_to memocities_url, notice: 'Memocity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memocity
      @memocity = Memocity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memocity_params
      params.require(:memocity).permit(:phoneNumberMemo, :contentMemo, :activationDateMemo)
    end
end
