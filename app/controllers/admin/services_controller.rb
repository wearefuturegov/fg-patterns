class Admin::ServicesController < Admin::BaseController
  def index
    @services = Service.where(status: 'awaiting_approval')
  end

  def edit
    @service = Service.find(params[:id])
  end
end