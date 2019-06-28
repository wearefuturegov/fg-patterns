class PatternsController < ApplicationController

  def index
    @patterns = Pattern.all
    if params[:selected]
      @selected_pattern = Pattern.find(params[:selected])
      @services = @selected_pattern.services.published.includes(:patterns, :life_events)
    else
      @services = Service.published.includes(:patterns, :life_events)
    end
  end
end
