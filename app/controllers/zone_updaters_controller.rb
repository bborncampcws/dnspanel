class ZoneUpdatersController < ApplicationController
  # GET /zone_updaters
  # GET /zone_updaters.json
  def index
    @zone_updaters = ZoneUpdater.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zone_updaters }
    end
  end

  # GET /zone_updaters/1
  # GET /zone_updaters/1.json
  def show
    @zone_updater = ZoneUpdater.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zone_updater }
    end
  end

  # GET /zone_updaters/new
  # GET /zone_updaters/new.json
  def new
    @zone_updater = ZoneUpdater.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zone_updater }
    end
  end

  # GET /zone_updaters/1/edit
  def edit
    @zone_updater = ZoneUpdater.find(params[:id])
  end

  # POST /zone_updaters
  # POST /zone_updaters.json
  def create
    @zone_updater = ZoneUpdater.new(params[:zone_updater])

    respond_to do |format|
      if @zone_updater.save
        format.html { redirect_to @zone_updater, notice: 'Zone updater was successfully created.' }
        format.json { render json: @zone_updater, status: :created, location: @zone_updater }
      else
        format.html { render action: "new" }
        format.json { render json: @zone_updater.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /zone_updaters/1
  # PUT /zone_updaters/1.json
  def update
    @zone_updater = ZoneUpdater.find(params[:id])

    respond_to do |format|
      if @zone_updater.update_attributes(params[:zone_updater])
        format.html { redirect_to @zone_updater, notice: 'Zone updater was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zone_updater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zone_updaters/1
  # DELETE /zone_updaters/1.json
  def destroy
    @zone_updater = ZoneUpdater.find(params[:id])
    @zone_updater.destroy

    respond_to do |format|
      format.html { redirect_to zone_updaters_url }
      format.json { head :no_content }
    end
  end
end
