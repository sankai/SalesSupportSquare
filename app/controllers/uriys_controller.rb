class UriysController < ApplicationController
  before_action :set_uriy, only: [:show, :edit, :update, :destroy]

  # GET /uriys
  # GET /uriys.json
  def index
    if params[:page].nil?
      # ページ繰り以外
      @searched = Hash.new()
      session[:searched] = @searched
      if params[:commit].nil?
        @searched[:month] = Date.today.month
      else
        # 検索ボタン押下時：画面入力された条件のセッションへの保存
        params[:search].each do | key, value |
          @searched.store(key.to_sym, value)
        end
      end
    else
      # ページ繰り時：検索条件のセッションからの取り出し
      @searched = session[:searched]
    end  
    unless params[:month].nil?
      @searched[:month] = params[:month]
    end 
    unless params[:e_bmn_id].nil?
      @searched[:e_bmn_id] = params[:e_bmn_id]
    end 
    unless params[:e_shain_id].nil?
      @searched[:e_shain_id] = params[:e_shain_id]
    end 

    @uriys = Uriy.joins(:anken)
    # まずは月を指示
    @uriys = @uriys.where(:month => @searched[:month])

    # 検索条件が指定されていれば、抽出条件としてwhere句を追加
    # 社員
    unless @searched.fetch(:e_shain_id, nil).blank?
      @uriys = @uriys.where('ankens.e_shain_id = ?', @searched.fetch(:e_shain_id))
    end
    
    # 部門
    if !(@searched.fetch(:e_bmn_id, nil).blank?)
      @uriys = @uriys.where('ankens.e_bmn_id = ?', @searched.fetch(:e_bmn_id))
    end
    # ページングを指示
    @uriys = @uriys.paginate(:page => params[:page], :order => 'month', :per_page => 20)

    @bmns      = Bmn.order(:code)   
    @shains    = Shain.order(:code)

  end

  # GET /uriys/1
  # GET /uriys/1.json
  def show
  end

  # GET /uriys/new
  def new
    @uriy = Uriy.new
  end

  # GET /uriys/1/edit
  def edit
  end

  # POST /uriys
  # POST /uriys.json
  def create
    @uriy = Uriy.new(uriy_params)

    respond_to do |format|
      if @uriy.save
        format.html { redirect_to @uriy, notice: 'Uriy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @uriy }
      else
        format.html { render action: 'new' }
        format.json { render json: @uriy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uriys/1
  # PATCH/PUT /uriys/1.json
  def update
    respond_to do |format|
      if @uriy.update(uriy_params)
        format.html { redirect_to @uriy, notice: 'Uriy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uriy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uriys/1
  # DELETE /uriys/1.json
  def destroy
    @uriy.destroy
    respond_to do |format|
      format.html { redirect_to uriys_url }
      format.json { head :no_content }
    end
  end

  #-- 売上予定一覧（社員別）
  def shains_tobe_sent
    if params[:month].nil?
      @month = Date.today.month
    else
      @month = params[:month]
    end
    
    @shains = Uriy.select_shains_by_month(@month)
    @templates = Mailtemplate.all
    
  end

  #-- 売上予定一覧（部門別）
  def bmns_tobe_sent
    if params[:month].nil?
      @month = Date.today.month
    else
      @month = params[:month]
    end
    
    @bmns = Uriy.select_bmns_by_month(@month)
    @templates = Mailtemplate.all
    
  end

  #-- 売上予定フォローメール発信（社員別）
  def send_to_shains
    @shains_sent   = Array.new
    @shains_unsent = Array.new
    
    template = Mailtemplate.find(params[:template][:id])
    if params[:month].nil?
      @month = Date.today.month
    else
      @month = params[:month]
    end
    params[:tobe_sent].each do | id |
      shain = Shain.find(id)
      unless shain.nil?
        if shain.email.blank?
          @shains_unsent.append(shain)
        else
          Followmail.send_follow_mail(shain, template, @month).deliver
          @shains_sent.append(shain)          
        end
      end
    end
    
  end

  #-- 売上予定フォローメール発信（部門別）
  def send_to_bmns
    @bmns_sent   = Array.new
    @bmns_unsent = Array.new
    
    template = Mailtemplate.find(params[:template][:id])
    if params[:month].nil?
      @month = Date.today.month
    else
      @month = params[:month]
    end
    params[:tobe_sent].each do | id |
      bmn = Bmn.find(id)
      unless bmn.nil?
        if bmn.d_email.blank?
          @bmns_unsent.append(bmn)
        else
          Followmail.send_follow_mail(bmn, template, @month).deliver
          @bmns_sent.append(bmn)          
        end
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uriy
      @uriy = Uriy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uriy_params
      params.require(:uriy).permit(:year, :month, :amount, :anken_id)
    end
end
