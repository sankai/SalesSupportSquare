# coding: utf-8

class Anken < ActiveRecord::Base

  belongs_to :kkk                                # 顧客
  belongs_to :dkkk,      :class_name => 'Kkk'    # 代表顧客
 #belongs_to :sk_ 	,    :class_name => 'Bmn'    # 主管部門
 #belongs_to :sk_shain,  :class_name => 'Shain'  # 
  belongs_to :e_bmn,     :class_name => 'Bmn'    # 
  belongs_to :e_shain,   :class_name => 'Shain'  # 営業担当者
  belongs_to :uribunya                           # 売上分野
  belongs_to :enduser                            # エンドユーザ
  belongs_to :jch_bmn,   :class_name => 'Bmn'    # 受注部門
  belongs_to :sei_shain, :class_name => 'Shain'  # 請求営業担当名
  belongs_to :sei_bmn,   :class_name => 'Bmn'    # 請求営業部門ID
  
  has_many   :uriys                              # 売上予定
  has_many   :urijs                              # 売上実績

  def self.statuslist
    return ['ｺﾝﾀｸﾄ中', '提案済み', '見積済未受', '受注済未売', '完了済未検', '売上', '失注']
  end

  # 以下、仮想属性のためのgetメソッド
  def mitmr_no_all
    unless self.mitmr_no.nil?
      return self.mitmr_no + '-' + self.mitmr_eda_no
    end
    return ''
  end

  def jch_name_v
    if self.jch_name == self.mitmr_name
      return '（同上）'
    end
    return self.jch_name
  end

  def prj_name_v
    if self.jch_name == self.mitmr_name
      if self.prj_name == self.mitmr_name
        return '（同左）'
      end
    end
    return self.jch_name
  end

  def kkk_code
    if self.kkk.nil?
      return ''
    end
    return self.kkk.code
  end
  def kkk_name
    if self.kkk.nil?
      return ''
    end
    return self.kkk.name
  end

  def e_shain_code
    if self.e_shain.nil?
      return ''
    end
    return self.e_shain.code
  end
  def e_shain_name
    if self.e_shain.nil?
      return ''
    end
    return self.e_shain.name
  end

  #def sk_bmn_code
  #  if self.sk_bmn.nil?
  #    return ''
  #  end
  #  return self.sk_bmn.code
  #end
  #def sk_bmn_name
  #  if self.sk_bmn.nil?
  #    return ''
  #  end
  #  return self.sk_bmn.name
  #end

  def e_bmn_code
    if self.e_bmn.nil?
      return ''
    end
    return self.e_bmn.code
  end
  def e_bmn_name
    if self.e_bmn.nil?
      return ''
    end
    return self.e_bmn.name
  end

  # 
  def get_uriy(month)
    self.uriys.each do | uriy |
      if uriy.month == month
        return uriy
      end
    end    
    return nil
  end

  # 
  def get_urij(month)
    self.urijs.each do | urij |
      if urij.month == month
        return urij
      end
    end
    return nil
  end  
  #
  def get_uriy_amount(month)
    uriy = self.get_uriy(month)
    if uriy.nil?
      return 0
    end
    return uriy.amount.to_i
  end

  def get_uriy_sum
    sum = 0
    self.uriys.each do | uriy |
      sum = sum + uriy.amount.to_i
    end
    return sum
  end

  def get_urij_amount(month)
    urij = self.get_urij(month)
    if urij.nil?
      return 0
    end
    return urij.amount.to_i
  end

  def get_urij_sum
    sum = 0
    self.urijs.each do | urij |
      sum = sum + urij.amount.to_i
    end
    return sum
  end

  # CSVの1行からAnkenインスタンスを生成し、各マスタも存在しなければ生成する。
  def self.from_csv(anArray)
    anAnken = new
    #unless anArray[0].blank?                         # 削除サインは無視しています
    #  return nil
    #end
    anAnken.status = convert(anArray[1])
    anAnken.mitmr_no = convert(anArray[2])
    anAnken.mitmr_eda_no = convert(anArray[3])

    anAnken.sk_bmn_code = convert(anArray[9])
    anAnken.sk_bmn_name = convert(anArray[10])

    anAnken.mitmr_name = convert(anArray[16])
    anAnken.jch_name = convert(anArray[17])
    anAnken.prj_name = convert(anArray[18])
    anAnken.prj_code = convert(anArray[19])
    anAnken.hiyo_kbn = convert(anArray[20])
    anAnken.shubetsu = convert(anArray[23])
    anAnken.theme2 = convert(anArray[24])
    anAnken.uri_project = convert(anArray[27])
    anAnken.nensho_yosan = convert(anArray[28])
    anAnken.kingaku = convert(anArray[30]).delete(',').to_i
    
    unless anArray[31].blank?
      unless anArray[31].index('99').nil?
        return nil
      end
      anAnken.jch_yotei_date = anArray[31]
    end
    
    anAnken.jch_no = convert(anArray[32])
    anAnken.jch_date = convert(anArray[34])
    anAnken.snksgy_sn_date = convert(anArray[35])
    anAnken.snksgy_sign = convert(anArray[36])
    anAnken.genka_kingaku = convert(anArray[37])
    anAnken.jch_arari_kingaku = convert(anArray[38])
    anAnken.jch_arari_rate = convert(anArray[39])
    anAnken.uri_y_zennen = convert(anArray[40]).delete(',').to_i
    anAnken.uri_y_jinen = convert(anArray[54]).delete(',').to_i
    anAnken.uri_y_final = convert(anArray[55])
    anAnken.uri_j_zennen = convert(anArray[56]).delete(',').to_i
    anAnken.uri_j_jinen = convert(anArray[70]).delete(',').to_i
    anAnken.jch_kakudo = convert(anArray[71])
    anAnken.eigyo_comment = convert(anArray[72])
    anAnken.jky_memo_comp = convert(anArray[73])
    anAnken.jky_memo_keyman = convert(anArray[74])
    anAnken.jky_memo_kadai = convert(anArray[75])
    anAnken.teian_irai_date = convert(anArray[76])
    anAnken.teian_date = convert(anArray[77])
    anAnken.c_hacchusho_no = convert(anArray[78])
    anAnken.mtmr_irai_date = convert(anArray[79])
    anAnken.mtmr_kaito_kigen_date = convert(anArray[80])
    anAnken.mtmr_date = convert(anArray[81])
    anAnken.anken_chusi_date = convert(anArray[82])
    anAnken.anken_kanryo_date = convert(anArray[83])
    anAnken.anken_syukka_date = convert(anArray[84])
    anAnken.seikyusho = convert(anArray[85])
    anAnken.seikyusho_date = convert(anArray[86])
    anAnken.gassan_seikyu_date = convert(anArray[87])
    anAnken.anken_kbn = convert(anArray[108])
    anAnken.jch_status = convert(anArray[114])
    anAnken.seikyu_status = convert(anArray[115])
    anAnken.sakusei_step = convert(anArray[116])
    anAnken.renban = convert(anArray[117])

    # 顧客            ------------------------
    anAnken.kkk      = find_or_create(Kkk, anArray[5], anArray[6])

    # 代表顧客        ------------------------
    #anAnken.dkkk     = find_or_create(Kkk, anArray[7], anArray[8])

    # 主管部門        ------------------------
    #anAnken.sk_bmn   = find_or_create(Bmn, anArray[9], anArray[10])

    # 営業部門        ------------------------
    anAnken.e_bmn    = find_or_create(Bmn, anArray[12], anArray[13])

    # 営業担当者      ------------------------
    anAnken.e_shain  = find_or_create(Shain, anArray[14], anArray[15])

    # 売上分野        ------------------------
    anAnken.uribunya = find_or_create(Uribunya, anArray[21], anArray[22])

    # エンドユーザ    ------------------------
    anAnken.enduser = find_or_create(Enduser, anArray[25], anArray[26])

    # 売上実績
    anAnken.setUriy(anArray, 41,  4)
    anAnken.setUriy(anArray, 42,  5)
    anAnken.setUriy(anArray, 43,  6)
    anAnken.setUriy(anArray, 44,  7)
    anAnken.setUriy(anArray, 45,  8)
    anAnken.setUriy(anArray, 46,  9)
    anAnken.setUriy(anArray, 47, 10)
    anAnken.setUriy(anArray, 48, 11)
    anAnken.setUriy(anArray, 49, 12)
    anAnken.setUriy(anArray, 50,  1)
    anAnken.setUriy(anArray, 51,  2)
    anAnken.setUriy(anArray, 52,  3)

    anAnken.setUrij(anArray, 57,  4)
    anAnken.setUrij(anArray, 58,  5)
    anAnken.setUrij(anArray, 59,  6)
    anAnken.setUrij(anArray, 60,  7)
    anAnken.setUrij(anArray, 61,  8)
    anAnken.setUrij(anArray, 62,  9)
    anAnken.setUrij(anArray, 63, 10)
    anAnken.setUrij(anArray, 64, 11)
    anAnken.setUrij(anArray, 65, 12)
    anAnken.setUrij(anArray, 66,  1)
    anAnken.setUrij(anArray, 67,  2)
    anAnken.setUrij(anArray, 68,  3)
    
    return anAnken
    
  end

  def self.convert(cell)
     unless cell.blank?
       return cell.to_s.encode('utf-8', 'sjis')
     end
     return nil
  end
  
  def self.find_or_create(aClass, code, name)
    obj = aClass.where(:code => code).first
    if obj.nil?
      obj = aClass.new
      obj.code = code
      obj.name = convert(name)
      obj.save
    end
    return obj
  end

  def setUriy(anArray, position, month)
    unless anArray[position].blank?
      unless anArray[position].to_f == 0
        uri        = Uriy.new
        uri.year   = 2013
        uri.month  = month
        uri.amount = anArray[position].delete(',').to_f
        uri.e_bmn_id    = self.e_bmn_id
        uri.e_shain_id  = self.e_shain_id
        self.uriys.append(uri)
      end
    end
  end
    
  def setUrij(anArray, position, month)
    unless anArray[position].blank?
      unless anArray[position].to_f == 0
        uri        = Urij.new
        uri.year   = 2013
        uri.month  = month
        uri.e_bmn_id    = self.e_bmn_id
        uri.e_shain_id  = self.e_shain_id
        uri.amount = anArray[position].delete(',').to_f
        self.urijs.append(uri)
      end
    end
  end

  def self.select_by_jchyy(year, month)
    year = Date.today.year
    from = Date.new(year, month, 1) 
    to   = Date.new(year, month, 1) 
    to   = to >> 1
    return self.where('jch_yotei_date between ? and ?', from, to)
  end
  
  # ２つのAnkenインスタンスをマージする。
  def merge(another)
    self.kingaku        = self.kingaku      + another.kingaku
    self.uri_y_zennen   = self.uri_y_zennen + another.uri_y_zennen
    self.uri_y_jinen    = self.uri_y_jinen  + another.uri_y_jinen
    self.uri_j_zennen   = self.uri_j_zennen + another.uri_j_zennen
    self.uri_j_jinen    = self.uri_j_jinen  + another.uri_j_jinen
    
    another.uriys.each do | uriy |
      myUriy = self.get_uriy(uriy.month)
      if myUriy.nil?
        self.uriys.append(uriy)
      else
        myUriy.amount = myUriy.amount + uriy.amount
        myUriy.save
      end
    end
    
    another.urijs.each do | urij |
      myUrij = self.get_urij(urij.month)
      if myUrij.nil?
        self.urijs.append(urij)
      else
        myUrij.amount = myUrij.amount + urij.amount
        myUrij.save
      end
    end
    
  end
  
end
