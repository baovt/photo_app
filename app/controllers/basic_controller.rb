class BasicController < ApplicationController
  def about
  end

  def index
    @featured_service = Service.where(:featured => true).order("updated_at DESC").first
    @design_services = Service.where(:featured => false).order("updated_at DESC").limit(4).offset(0)
  end

  def gallery_tags
  end

end
