class BmnsController < ApplicationController
  before_action :set_bmn, only: [:show, :edit, :update, :destroy]

  # GET /bmns
  # GET /bmns.json
  def index
    @bmns = Bmn.order(:code)
  end

  # GET /bmns/1
  # GET /bmns/1.json
  def show
  end

  # GET /bmns/new
  def new
    @bmn = Bmn.new
  end

  # GET /bmns/1/edit
  def edit
  end

  # POST /bmns
  # POST /bmns.json
  def create
    @bmn = Bmn.new(bmn_params)

    respond_to do |format|
      if @bmn.save
        format.html { redirect_to @bmn, notice: 'Bmn was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bmn }
      else
        format.html { render action: 'new' }
        format.json { render json: @bmn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bmns/1
  # PATCH/PUT /bmns/1.json
  def update
    respond_to do |format|
      if @bmn.update(bmn_params)
        format.html { redirect_to @bmn, notice: 'Bmn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bmn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bmns/1
  # DELETE /bmns/1.json
  def destroy
    @bmn.destroy
    respond_to do |format|
      format.html { redirect_to bmns_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bmn
      @bmn = Bmn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bmn_params
      params.require(:bmn).permit(:code, :name)
    end
end
