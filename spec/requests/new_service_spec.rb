RSpec.describe "New service", type: :request do
  it "goes to create a new service" do
    get new_service_path
    expect(response.body).to include("Add a new service")
  end

  it "creates a new service" do
    service = Service.create(
      name: "This is a service name",
      organisation_types: ["District council"],
      steps: "A. Step 1
      B. Step 2",
      life_events: [LifeEvent.first],
      suggester_email: 'example@wearefuturegov.com',
      suggester_organisation: 'FutureGov'
    )
    expect(Service.last).to eq(service)
  end
end