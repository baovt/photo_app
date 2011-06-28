class Admin::ServicesController < Admin::AdminController
  # GET /services
  # GET /services.xml
  def index
    @services = Service.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @services }
    end
  end

  # GET /services/1
  # GET /services/1.xml
  def show
    @service = Service.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service }
    end
  end

  # GET /services/new
  def new
    @service = Service.new
    2.times {
    @service.photos.build
    }
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        format.html { redirect_to([:admin, @service], :notice => 'Service was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /services/1
  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to([:admin, @service], :notice => 'Service was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /services/1
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to(admin_services_url) }
    end
  end
end
