class PatternsController < ApplicationController

  def index
    @patterns = Pattern.all
    if params[:selected]
      @selected_pattern = Pattern.find(params[:selected])
      @services = @selected_pattern.services.published
    else
      @services = Service.published
    end
  end
end
