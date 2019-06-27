class ServiceMailerPreview < ActionMailer::Preview
  def thankyou
    service = Service.first
    service.suggester_name = "Bob"
    ServiceMailer.thankyou(service)
  end

  def service_approved
    service = Service.first
    service.suggester_name = "Bob"
    ServiceMailer.service_approved(service)
  end

  def new_service
    service = Service.first
    ServiceMailer.new_service(service)
  end
end