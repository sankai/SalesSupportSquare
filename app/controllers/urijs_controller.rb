class UrijsController < ApplicationController
  before_action :set_urij, only: [:show, :edit, :update, :destroy]

  # GET /urijs
  # GET /urijs.json
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
    @urijs = Urij.joins(:anken)
    # まずは月を指示
    @urijs = @urijs.where(:month => @searched[:month])

    # 検索条件が指定されていれば、抽出条件としてwhere句を追加
    # 社員
    unless @searched.fetch(:e_shain_id, nil).blank?
      @urijs = @urijs.where('ankens.e_shain_id = ?', @searched.fetch(:e_shain_id))
    end
    
    # 部門
    if !(@searched.fetch(:e_bmn_id, nil).blank?)
      @urijs = @urijs.where('ankens.e_bmn_id = ?', @searched.fetch(:e_bmn_id))
    end
    # ページングを指示
    @urijs = @urijs.paginate(:page => params[:page], :order => 'month', :per_page => 20)

    
    @bmns      = Bmn.order(:code)   
    @shains    = Shain.order(:code)

  end

  # GET /urijs/1
  # GET /urijs/1.json
  def show
  end

  # GET /urijs/new
  def new
    @urij = Urij.new
  end

  # GET /urijs/1/edit
  def edit
  end

  # POST /urijs
  # POST /urijs.json
  def create
    @urij = Urij.new(urij_params)

    respond_to do |format|
      if @urij.save
        format.html { redirect_to @urij, notice: 'Urij was successfully created.' }
        format.json { render action: 'show', status: :created, location: @urij }
      else
        format.html { render action: 'new' }
        format.json { render json: @urij.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urijs/1
  # PATCH/PUT /urijs/1.json
  def update
    respond_to do |format|
      if @urij.update(urij_params)
        format.html { redirect_to @urij, notice: 'Urij was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @urij.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urijs/1
  # DELETE /urijs/1.json
  def destroy
    @urij.destroy
    respond_to do |format|
      format.html { redirect_to urijs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urij
      @urij = Urij.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urij_params
      params.require(:urij).permit(:year, :month, :amount, :anken_id)
    end
end
