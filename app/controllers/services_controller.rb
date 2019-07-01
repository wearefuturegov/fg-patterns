class ServicesController < ApplicationController

  def new
    @service = Service.new
  end

  def index
    @patterns = Pattern.all
    if params[:selected]
      @selected_pattern = Pattern.find(params[:selected])
      @services = @selected_pattern.services.published
    else
      @services = Service.published
    end
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      ServiceMailer.thankyou(@service).deliver
      ServiceMailer.new_service(@service).deliver
      render 'confirmation'
    else
      render 'new'
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  private

  def service_params
    params.require(:service).permit(:name, :steps, :suggester_name, :suggester_email, :suggester_organisation, :transactional, organisation_types: [], pattern_ids: [], life_event_ids: [])
  end
end