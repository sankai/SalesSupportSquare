class MailsentsController < ApplicationController
  before_action :set_mailsent, only: [:show, :edit, :update, :destroy]

  # GET /mailsents
  # GET /mailsents.json
  def index
    @mailsents = Mailsent.all
  end

  # GET /mailsents/1
  # GET /mailsents/1.json
  def show
  end

  # GET /mailsents/new
  def new
    @mailsent = Mailsent.new
  end

  # GET /mailsents/1/edit
  def edit
  end

  # POST /mailsents
  # POST /mailsents.json
  def create
    @mailsent = Mailsent.new(mailsent_params)

    respond_to do |format|
      if @mailsent.save
        format.html { redirect_to @mailsent, notice: 'Mailsent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mailsent }
      else
        format.html { render action: 'new' }
        format.json { render json: @mailsent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailsents/1
  # PATCH/PUT /mailsents/1.json
  def update
    respond_to do |format|
      if @mailsent.update(mailsent_params)
        format.html { redirect_to @mailsent, notice: 'Mailsent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mailsent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailsents/1
  # DELETE /mailsents/1.json
  def destroy
    @mailsent.destroy
    respond_to do |format|
      format.html { redirect_to mailsents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailsent
      @mailsent = Mailsent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailsent_params
      params.require(:mailsent).permit(:mailtemplate_id, :sent_time)
    end
end
