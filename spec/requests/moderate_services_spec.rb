RSpec.describe "Moderate services", type: :request do

  it "denies access for the unauthenticated" do
    get admin_services_path
    expect(response.status).to eq(401)
  end

end