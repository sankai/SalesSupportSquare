class KkksController < ApplicationController
  before_action :set_kkk, only: [:show, :edit, :update, :destroy]

  # GET /kkks
  # GET /kkks.json
  def index
    @kkks = Kkk.order(:code)
  end

  # GET /kkks/1
  # GET /kkks/1.json
  def show
  end

  # GET /kkks/new
  def new
    @kkk = Kkk.new
  end

  # GET /kkks/1/edit
  def edit
  end

  # POST /kkks
  # POST /kkks.json
  def create
    @kkk = Kkk.new(kkk_params)

    respond_to do |format|
      if @kkk.save
        format.html { redirect_to @kkk, notice: 'Kkk was successfully created.' }
        format.json { render action: 'show', status: :created, location: @kkk }
      else
        format.html { render action: 'new' }
        format.json { render json: @kkk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kkks/1
  # PATCH/PUT /kkks/1.json
  def update
    respond_to do |format|
      if @kkk.update(kkk_params)
        format.html { redirect_to @kkk, notice: 'Kkk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kkk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kkks/1
  # DELETE /kkks/1.json
  def destroy
    @kkk.destroy
    respond_to do |format|
      format.html { redirect_to kkks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kkk
      @kkk = Kkk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kkk_params
      params.require(:kkk).permit(:code, :name)
    end
end
