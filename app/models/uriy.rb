# coding: utf-8

class Uriy < ActiveRecord::Base
  belongs_to :anken
  belongs_to :e_shain, :class_name => 'Shain'
  belongs_to :e_bmn,   :class_name => 'Bmn'

  # 月を条件に、売上予定のある部門のみをArrayで返す。
  def self.select_bmns_by_month(month)
   
    bmns = Array.new
    bmn_ids = Array.new
    uriys = self.joins(:anken)
    uriys = uriys.where('ankens.status = ?', '受注済未売')
    uriys.where(:month => month).each do | uriy |
      bmn_ids.append(uriy.e_bmn_id)
    end
    bmn_ids.uniq.each do | id |
      bmns.append(Bmn.find(id))
    end
    return bmns
  end
  
  # 月を条件に、売上予定のある社員のみをArrayで返す。
  def self.select_shains_by_month(month)
   
    shains = Array.new
    shain_ids = Array.new
    uriys = self.joins(:anken)
    uriys = uriys.where('ankens.status = ?', '受注済未売')
    uriys.where(:month => month).each do | uriy |
      shain_ids.append(uriy.e_shain_id)
    end
    shain_ids.uniq.each do | id |
      shains.append(Shain.find(id))
    end
    return shains
  end

  # 社員と月を条件に、全件抽出
  def self.select_by_shain_month(shain, month)
    uriys = self.joins(:anken)
    uriys = uriys.where('ankens.e_shain_id = ?', shain.id)
    uriys = uriys.where(:month => month)
    return uriys
  end

end
