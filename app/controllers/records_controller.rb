class RecordsController < ApplicationController
  def create
    @zone=Zone.find(params[:zone_id])
    @record=@zone.records.create(params[:record])
    redirect_to zone_path(@zone)
  end
end
