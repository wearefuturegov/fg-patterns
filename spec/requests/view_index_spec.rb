RSpec.describe "View index", type: :request do
  it "displays patterns on index page" do
    get root_path
    expect(response).to be_successful
    expect(response.body).to include('Service patterns for local government')
  end
end