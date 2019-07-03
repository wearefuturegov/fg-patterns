class ServicesController < ApplicationController
  before_action :load_index_data, only: :index

  def new
    @service = Service.new
  end

  def index

    if @selected_life_event
      if @selected_pattern
        service_ids = @selected_pattern.services.includes(:life_events).where(life_events: { id: @selected_life_event.id }).select(:id).map{|service| service.id}
        @services = @selected_pattern.services.published.includes(:life_events).where(id: service_ids)
      else
        service_ids = Service.published.includes(:life_events).where(life_events: { id: params[:life_event_select] }).map{|service| service.id}
        @services = Service.published.includes(:life_events).where(id: service_ids)
      end
    else
      if @selected_pattern
        @services = @selected_pattern.services.published.includes(:life_events)
      else
        @services = Service.published.includes(:life_events)
      end
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

  def confirmation
  end

  def show
    @service = Service.find(params[:id])
  end

  private

  def load_index_data
    if @selected_pattern = Pattern.where(slug: params[:slug]).first
      @life_events = @selected_pattern.life_events.order(:name).uniq
    else
      @life_events = LifeEvent.order(:name)
    end
    @patterns = Pattern.all

    if is_integer? params[:life_event_select]
      @selected_life_event = LifeEvent.find(params[:life_event_select])
    end
  end

  def is_integer? string_to_check
    if !/\A\d+\z/.match(string_to_check)
      false
    else
      true
    end
  end

  def service_params
    params.require(:service).permit(:name, :steps, :suggester_name, :suggester_email, :suggester_organisation, :transactional, organisation_types: [], pattern_ids: [], life_event_ids: [])
  end
end