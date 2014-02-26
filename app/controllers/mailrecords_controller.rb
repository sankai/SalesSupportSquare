class MailrecordsController < ApplicationController
  before_action :set_mailrecord, only: [:show, :edit, :update, :destroy]

  # GET /mailrecords
  # GET /mailrecords.json
  def index
    @mailrecords = Mailrecord.all
  end

  # GET /mailrecords/1
  # GET /mailrecords/1.json
  def show
  end

  # GET /mailrecords/new
  def new
    @mailrecord = Mailrecord.new
  end

  # GET /mailrecords/1/edit
  def edit
  end

  # POST /mailrecords
  # POST /mailrecords.json
  def create
    @mailrecord = Mailrecord.new(mailrecord_params)

    respond_to do |format|
      if @mailrecord.save
        format.html { redirect_to @mailrecord, notice: 'Mailrecord was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mailrecord }
      else
        format.html { render action: 'new' }
        format.json { render json: @mailrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailrecords/1
  # PATCH/PUT /mailrecords/1.json
  def update
    respond_to do |format|
      if @mailrecord.update(mailrecord_params)
        format.html { redirect_to @mailrecord, notice: 'Mailrecord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mailrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailrecords/1
  # DELETE /mailrecords/1.json
  def destroy
    @mailrecord.destroy
    respond_to do |format|
      format.html { redirect_to mailrecords_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailrecord
      @mailrecord = Mailrecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailrecord_params
      params.require(:mailrecord).permit(:shain_id, :mailsent_id)
    end
end
