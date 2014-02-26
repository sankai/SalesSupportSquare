class Bmn < ActiveRecord::Base
  validates :code, uniqueness: true
  def code_and_name
    return code + ':' + name
  end
end
