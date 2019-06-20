class ServicesController < ApplicationController

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      render 'confirmation'
    else
      render 'new'
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :pattern_ids, :organisation_type, :sub_services)
  end
end