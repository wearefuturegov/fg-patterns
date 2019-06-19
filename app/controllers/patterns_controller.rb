class PatternsController < ApplicationController

  def index
    @patterns = Pattern.all
    if params[:selected]
      @selected_pattern = Pattern.find(params[:selected])
      @services = @selected_pattern.services
    else
      @services = Service.all
    end
  end
end
