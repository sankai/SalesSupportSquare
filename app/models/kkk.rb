class Kkk < ActiveRecord::Base
  validates :code, uniqueness: true
end
