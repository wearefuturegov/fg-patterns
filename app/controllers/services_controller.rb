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

  def show
    @service = Service.find(params[:id])
  end

  def index
  end

  private

  def service_params
    params.require(:service).permit(:name, :steps, :suggester_email, :suggester_organisation, :transactional, organisation_types: [], pattern_ids: [], life_event_ids: [])
  end
end