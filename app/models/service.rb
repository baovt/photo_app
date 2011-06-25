class Service < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :reject_if => proc { |attributes| attributes['name'].blank? }, :allow_destroy => true
  
end
