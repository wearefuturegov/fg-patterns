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
    params.require(:service).permit(:name, :steps, :suggester_email, :suggester_organisation, organisation_types: [], pattern_ids: [])
  end
end