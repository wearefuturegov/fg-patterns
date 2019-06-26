class ServiceMailer < ActionMailer::Base

  layout 'fg_mailer'

  def thankyou service
    recipient = service.suggester_email
    sender = ENV['ADMIN_EMAIL']
    @name = service.name
    mail(
      to: recipient,
      from: sender,
      subject: "Thanks for submitting the service: #{@name}"
    )
  end

  def new_service service
    recipient = ENV['ADMIN_EMAIL']
    sender = ENV['ADMIN_EMAIL']
    @suggester_name = service.suggester_name
    mail(
      to: recipient,
      from: sender,
      subject: "New service submitted: #{@name}"
    )
  end

  def service_approved service
    recipient = service.suggester_email
    sender = ENV['ADMIN_EMAIL']
    @suggester_name = service.suggester_name
    mail(
      to: recipient,
      from: sender,
      subject: "Service published"
    )
  end

end