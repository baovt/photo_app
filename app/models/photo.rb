class Photo < ActiveRecord::Base
  belongs_to :service
  has_attached_file :image, :styles => {:thumb => '50x' }
end
