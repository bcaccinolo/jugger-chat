class BootsController < ApplicationController
  # GET /boots
  # GET /boots.xml
  def index
    @boots = Boot.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boots }
    end
  end

  # GET /boots/1
  # GET /boots/1.xml
  def show
    @boot = Boot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @boot }
    end
  end

  # GET /boots/new
  # GET /boots/new.xml
  def new
    @boot = Boot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @boot }
    end
  end

  # GET /boots/1/edit
  def edit
    @boot = Boot.find(params[:id])
  end

  # POST /boots
  # POST /boots.xml
  def create
    @boot = Boot.new(params[:boot])

    respond_to do |format|
      if @boot.save
        flash[:notice] = 'Boot was successfully created.'
        format.html { redirect_to(@boot) }
        format.xml  { render :xml => @boot, :status => :created, :location => @boot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @boot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boots/1
  # PUT /boots/1.xml
  def update
    @boot = Boot.find(params[:id])

    respond_to do |format|
      if @boot.update_attributes(params[:boot])
        flash[:notice] = 'Boot was successfully updated.'
        format.html { redirect_to(@boot) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @boot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boots/1
  # DELETE /boots/1.xml
  def destroy
    @boot = Boot.find(params[:id])
    @boot.destroy

    respond_to do |format|
      format.html { redirect_to(boots_url) }
      format.xml  { head :ok }
    end
  end
end
