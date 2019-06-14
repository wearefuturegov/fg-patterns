class PatternsController < ApplicationController

  def index
    pattern = params[:pattern] || 'all'
    @patterns = Pattern.send(pattern)
  end
end