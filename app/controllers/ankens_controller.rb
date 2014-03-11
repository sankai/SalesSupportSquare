class AnkensController < ApplicationController
  before_action :set_anken, only: [:show, :edit, :update, :destroy]

  # GET /ankens
  # GET /ankens.json
  def index
    #
    # 案件を抽出する    
    # 1.初期表示（メニューなどからの遷移時）
    #    ログインユーザの部門コードのみを条件に抽出
    #    ①検索条件のクリア
    #    ②ログインユーザの部門コードという条件のみセッションへの保存
    # 2.検索ボタン押下時
    #    画面入力された条件に対して抽出
    #    ①検索条件のクリア
    #    ②画面入力された条件のセッションへの保存
    # 3.ページ繰り時
    #    直前の検索条件をもとにページ繰り
    #    ①検索条件のセッションからの取り出し

    if params[:page].nil?
      # ページ繰り以外
      @searched = Hash.new()
      session[:searched] = @searched
      if params[:commit].nil?
        # 初期表示時
        
      else
        # 検索ボタン押下時：画面入力された条件のセッションへの保存
        params[:search].each do | key, value |
          @searched.store(key, value)
        end
      end
    else
      # ページ繰り時：検索条件のセッションからの取り出し
      @searched = session[:searched]
    end
    
    @ankens = Anken.joins(:kkk)
    # まずはページングを指示
    @ankens = @ankens.paginate(:page => params[:page], :order => 'id', :per_page => 10)
    # （無条件に）受注番号がOで始まること
    @ankens = @ankens.where("jch_no like ?", 'O%')
    
    # 検索条件が指定されていれば、抽出条件としてwhere句を追加
    # 案件ステータス
    unless @searched.fetch('status', nil).blank?
      @ankens = @ankens.where('ankens.status = ?', @searched.fetch('status'))
    end
    
    # 見積もり番号
    if !(@searched.fetch('mitmr_no', nil).blank?)
      @ankens = @ankens.where('ankens.mitmr_no = ?', @searched.fetch('mitmr_no'))
    end
    # 顧客名称
    if !(@searched.fetch('kkk_name', nil).blank?)
      @ankens = @ankens.where('kkks.name like ?', '%' + @searched.fetch('kkk_name') + '%')
    end
    # 営業部門
    if !(@searched.fetch('e_bmn_id', nil).blank?)
      @ankens = @ankens.where('ankens.e_bmn_id = ?', @searched.fetch('e_bmn_id'))
    end
    # 営業担当者
    if !(@searched.fetch('e_shain_id', nil).blank?)
      @ankens = @ankens.where('ankens.e_shain_id = ?', @searched.fetch('e_shain_id'))
    end
    # 見積もり件名
    if !(@searched.fetch('mitmr_name', nil).blank?)
      @ankens = @ankens.where('ankens.mitmr_name like ?', '%' + @searched.fetch('mitmr_name') + '%')
    end
    # 受注件名
    if !(@searched.fetch('jch_name', nil).blank?)
      @ankens = @ankens.where('ankens.jch_name like ?', '%' + @searched.fetch('jch_name') + '%')
    end
    # 受注件名
    if !(@searched.fetch('prj_code', nil).blank?)
      @ankens = @ankens.where('ankens.prj_code = ?', @searched.fetch('prj_code'))
    end

    @statuses  = Anken.statuslist	
    
    @bmns      = Bmn.order(:code)
    
    @shains    = Shain.order(:code)
    
  end

  # GET /ankens/1
  # GET /ankens/1.json
  def show
  end

  # GET /ankens/new
  def new
    @anken = Anken.new
  end

  # GET /ankens/1/edit
  def edit
  end

  # POST /ankens
  # POST /ankens.json
  def create
    @anken = Anken.new(anken_params)

    respond_to do |format|
      if @anken.save
        format.html { redirect_to @anken, notice: 'Anken was successfully created.' }
        format.json { render action: 'show', status: :created, location: @anken }
      else
        format.html { render action: 'new' }
        format.json { render json: @anken.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ankens/1
  # PATCH/PUT /ankens/1.json
  def update
    respond_to do |format|
      if @anken.update(anken_params)
        format.html { redirect_to @anken, notice: 'Anken was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @anken.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ankens/1
  # DELETE /ankens/1.json
  def destroy
    @anken.destroy
    respond_to do |format|
      format.html { redirect_to ankens_url }
      format.json { head :no_content }
    end
  end
  # CSVアップロード
  # CSV Upload /upload
  def upload
    require 'csv'
	  if params[:upload_file].blank?
	    return
	  end
	  Anken.transaction do

	    Anken.connection.execute("delete from ankens;")
	    Urij.connection.execute("delete from urijs;")
	    Uriy.connection.execute("delete from uriys;")

	  end
	  
	  anken_keys = Hash.new()
	  
	  reader = params[:upload_file].read
	  CSV.parse(reader) do |row|
	    ActiveRecord::Base.transaction do
	      anAnken = Anken.from_csv(row)
	      unless anAnken.nil?
	        another = anken_keys.fetch(anAnken.jch_no, nil)
	        unless another.blank?
            another.merge(anAnken)
	          another.save()
	        else
	          unless anAnken.jch_no.blank?
              anken_keys.store(anAnken.jch_no, anAnken)
	          end
	          anAnken.save()
	        end
	      end
	    end
	  end
	  redirect_to '/ankens'
	  # render  :action => :index
  end

  # 受注予定リスト
  def jchy_index
    if params[:page].nil?
      # ページ繰り以外
      @searched = Hash.new()
      session[:searched] = @searched
      if params[:commit].nil?
        @searched[:year]  = Date.today.year
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
    unless params[:year].nil?
      @searched[:year]  = params[:year]
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
    #@ankens = Anken.all
    @statuses  = Anken.statuslist
    
    # まずは月を指示
    @ankens = Anken.select_by_jchyy(@searched[:year].to_i, @searched[:month].to_i)
    @ankens = @ankens.where('ankens.status = ? or ankens.status = ?  or ankens.status = ? ', @statuses[0], @statuses[1], @statuses[2])

    # 検索条件が指定されていれば、抽出条件としてwhere句を追加
    # 社員
    unless @searched.fetch(:e_shain_id, nil).blank?
      @ankens = @ankens.where('ankens.e_shain_id = ?', @searched.fetch(:e_shain_id))
    end
    
    # 部門
    if !(@searched.fetch(:e_bmn_id, nil).blank?)
      @ankens = @ankens.where('ankens.e_bmn_id = ?', @searched.fetch(:e_bmn_id))
    end
    # ページングを指示
    @ankens = @ankens.paginate(:page => params[:page], :per_page => 20)

    @bmns      = Bmn.order(:code)   
    @shains    = Shain.order(:code)  
  
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anken
      @anken = Anken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anken_params
      params.require(:anken).permit(:status, :mitmr_no, :mitmr_eda_no, :kkk_id, :sk_bmn_id, :sk_shain_id, :e_bmn_id, :e_shain_id, :mitmr_name, :jch_name, :prj_name, :prj_code, :hiyo_kbn, :uribunya_id, :shubetsu, :theme2, :enduser_id, :uri_project, :nensho_yosan, :kingaku, :jch_yotei_date, :jch_no, :jch_date, :snksgy_sn_date, :snksgy_sign, :genka_kingaku, :jch_arari_kingaku, :jch_arari_rate, :uri_y_zennen, :uri_y_jinen, :uri_y_final, :uri_j_zennen, :uri_j_jinen, :jch_kakudo, :eigyo_comment, :jky_memo_comp, :jky_memo_keyman, :jky_memo_kadai, :teian_irai_date, :teian_date, :c_hacchusho_no, :mtmr_irai_date, :mtmr_kaito_kigen_date, :mtmr_date, :anken_chusi_date, :anken_kanryo_date, :anken_syukka_date, :seikyusho, :seikyusho_date, :gassan_seikyu_date, :anken_kbn, :e_shain_id, :jch_bmn_id, :sei_shain_id, :sei_bmn_id, :jch_status, :seikyu_status, :sakusei_step, :renban)
    end
end
