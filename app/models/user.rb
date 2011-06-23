class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = true
  end
    
  attr_accessor :password_reset, :password_confirmation
  
  validates :username, :presence => true
  validates :password, :presence => true, :if => :should_validate_password?  
  validates :password, :length => {:within => 4..40}, :if => :should_validate_password?
  validate  :confirm_password
  
  private
    
  def should_validate_password?
    new_record? || !self.password.blank? || password_reset
  end
  
  def confirm_password
    if should_validate_password? && !self.new_record?
      return self.errors.add :password_confirmation, "Please confirm your password." if self.password_confirmation.blank?
      return self.errors.add :password, "Your passwords do not match." if self.password != self.password_confirmation
    end
  end
end
