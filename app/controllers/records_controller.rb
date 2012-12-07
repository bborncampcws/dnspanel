class RecordsController < ApplicationController
  def create
    @zone=Zone.find(params[:zone_id])
    @record=@zone.records.create(params[:record])
    redirect_to zone_path(@zone)
  end

  def edit
    @record = Record.find(params[:id])
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @record = Record.find(params[:id])
    @zone=@record.zone
    respond_to do |format|
      if @record.update_attributes(params[:record])
        format.html { redirect_to @zone, notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

def destroy
    @record = Record.find(params[:id])
    @zone = Zone.find(params[:zone_id])
    @record.destroy

    respond_to do |format|
      format.html { redirect_to(@zone, :notice => 'Record was successfully deleted.') }
      format.xml  { head :ok }
    end
  end

end
