class BasicController < ApplicationController
  def about
  end

  def index
    @featured_services = Service.where(:featured => true).first
    @design_services = Service.where(:featured => false).limit(4).offset(0)
  end

  def gallery_tags
  end

end
