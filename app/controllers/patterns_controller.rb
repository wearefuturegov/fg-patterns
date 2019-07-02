class PatternsController < ApplicationController

  def show # This is actually just a filter on services index
    @patterns = Pattern.all
    @selected_pattern = Pattern.where(slug: params[:slug]).first
    @life_events = @selected_pattern.life_events.order(:name).uniq

    if is_integer? params[:life_event_select]
      @selected_life_event = LifeEvent.find(params[:life_event_select])
      @services = @selected_pattern.services.published.includes(:life_events).where(life_events: { id: params[:life_event_select] })
    else
      @services = @selected_pattern.services.published.includes(:life_events)
    end
    render 'services/index'
  end
end
