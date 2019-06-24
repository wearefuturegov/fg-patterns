RSpec.describe "Show service", type: :request do
  it "shows a service" do
    service = Service.last
    get service_path(service)
    expect(response).to be_successful

    service.organisation_types.each do |org_type|
      expect(response.body).to include(org_type)
    end

    service.patterns.each do |pattern|
      expect(response.body).to include(pattern.name)
    end

    service.life_events.each do |life_event|
      expect(response.body).to include(life_event.name)
    end

    if service.transactional?
      expect(response.body).to include("Yes")
    else
      expect(response.body).to include("No")
    end

    #expect(response.body).to include(service.steps)
  end
end