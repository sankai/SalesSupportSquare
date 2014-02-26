class Enduser < ActiveRecord::Base
  validates :code, uniqueness: true
end
