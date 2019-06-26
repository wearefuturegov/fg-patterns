class Admin::ServicesController < Admin::BaseController
  def index
    @services = Service.where(status: 'awaiting_approval')
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(service_params.merge(status: 'published'))
      flash[:notice] = "Service #{@service.name} was published"
      redirect_to patterns_path
    else
      render 'edit'
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :steps, :suggester_email, :suggester_organisation, :transactional, organisation_types: [], pattern_ids: [], life_event_ids: [])
  end
end