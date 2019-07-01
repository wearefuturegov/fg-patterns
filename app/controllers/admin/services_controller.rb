class Admin::ServicesController < Admin::BaseController
  def index
    @services = Service.where(status: 'awaiting_approval').order(created_at: :desc)
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    new_service = (@service.status == 'awaiting_approval' ? true : false)

    if @service.update_attributes(service_params.merge(status: 'published'))
      if new_service
        ServiceMailer.service_approved(@service).deliver
      end
      flash[:notice] = "Service #{@service.name} was published"
      redirect_to services_path
    else
      render 'edit'
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :steps, :suggester_email, :suggester_organisation, :transactional, organisation_types: [], pattern_ids: [], life_event_ids: [])
  end
end