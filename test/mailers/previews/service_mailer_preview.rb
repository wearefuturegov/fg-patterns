class ServiceMailerPreview < ActionMailer::Preview
  def thankyou
    service = Service.first
    ServiceMailer.thankyou(service)
  end

  def service_approved
    service = Service.first
    ServiceMailer.service_approved(service)
  end

  def new_service
    service = Service.first
    ServiceMailer.new_service(service)
  end
end