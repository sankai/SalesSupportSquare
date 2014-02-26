class UribunyasController < ApplicationController
  before_action :set_uribunya, only: [:show, :edit, :update, :destroy]

  # GET /uribunyas
  # GET /uribunyas.json
  def index
    @uribunyas = Uribunya.all
  end

  # GET /uribunyas/1
  # GET /uribunyas/1.json
  def show
  end

  # GET /uribunyas/new
  def new
    @uribunya = Uribunya.new
  end

  # GET /uribunyas/1/edit
  def edit
  end

  # POST /uribunyas
  # POST /uribunyas.json
  def create
    @uribunya = Uribunya.new(uribunya_params)

    respond_to do |format|
      if @uribunya.save
        format.html { redirect_to @uribunya, notice: 'Uribunya was successfully created.' }
        format.json { render action: 'show', status: :created, location: @uribunya }
      else
        format.html { render action: 'new' }
        format.json { render json: @uribunya.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uribunyas/1
  # PATCH/PUT /uribunyas/1.json
  def update
    respond_to do |format|
      if @uribunya.update(uribunya_params)
        format.html { redirect_to @uribunya, notice: 'Uribunya was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uribunya.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uribunyas/1
  # DELETE /uribunyas/1.json
  def destroy
    @uribunya.destroy
    respond_to do |format|
      format.html { redirect_to uribunyas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uribunya
      @uribunya = Uribunya.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uribunya_params
      params.require(:uribunya).permit(:code, :name)
    end
end
