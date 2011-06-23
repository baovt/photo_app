class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => {:thumb => '50x' }
end
