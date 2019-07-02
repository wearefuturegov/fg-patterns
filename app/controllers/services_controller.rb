class ServicesController < ApplicationController

  def new
    @service = Service.new
  end

  def index
    @patterns = Pattern.all
    @life_events = LifeEvent.order(:name)

    if is_integer? params[:life_event_select]
      @selected_life_event = LifeEvent.find(params[:life_event_select])
      @services = Service.published.where(life_events: { id: params[:life_event_select] }).includes(:life_events)
    else
      @services = Service.published.includes(:life_events)
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