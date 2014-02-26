class Shain < ActiveRecord::Base

  #validates :code, uniqueness: true
  #validates :name, uniqueness: true
  #validates :email, uniqueness: true
  has_many :uriys
  has_many :urijs
  
  def code_and_name
    unless (code.blank? or name.blank?)
      return code + ':' + name
    else
      return ''
    end
  end

end
