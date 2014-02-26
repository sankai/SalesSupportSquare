class Uribunya < ActiveRecord::Base
  validates :code, uniqueness: true
end
