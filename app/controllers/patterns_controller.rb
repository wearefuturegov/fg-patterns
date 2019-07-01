class PatternsController < ApplicationController

  def show
    @patterns = Pattern.all
    @selected_pattern = Pattern.where(slug: params[:slug]).first
    @services = @selected_pattern.services.published
    render 'services/index'
  end
end
