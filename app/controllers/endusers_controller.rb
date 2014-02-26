class EndusersController < ApplicationController
  before_action :set_enduser, only: [:show, :edit, :update, :destroy]

  # GET /endusers
  # GET /endusers.json
  def index
    @endusers = Enduser.all
  end

  # GET /endusers/1
  # GET /endusers/1.json
  def show
  end

  # GET /endusers/new
  def new
    @enduser = Enduser.new
  end

  # GET /endusers/1/edit
  def edit
  end

  # POST /endusers
  # POST /endusers.json
  def create
    @enduser = Enduser.new(enduser_params)

    respond_to do |format|
      if @enduser.save
        format.html { redirect_to @enduser, notice: 'Enduser was successfully created.' }
        format.json { render action: 'show', status: :created, location: @enduser }
      else
        format.html { render action: 'new' }
        format.json { render json: @enduser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /endusers/1
  # PATCH/PUT /endusers/1.json
  def update
    respond_to do |format|
      if @enduser.update(enduser_params)
        format.html { redirect_to @enduser, notice: 'Enduser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @enduser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /endusers/1
  # DELETE /endusers/1.json
  def destroy
    @enduser.destroy
    respond_to do |format|
      format.html { redirect_to endusers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enduser
      @enduser = Enduser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enduser_params
      params.require(:enduser).permit(:code, :name)
    end
end
