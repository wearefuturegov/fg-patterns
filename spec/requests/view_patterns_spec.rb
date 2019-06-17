RSpec.describe "View Patterns", type: :request do
  it "displays patterns on index page" do
    get patterns_path
    expect(response).to be_successful
    Pattern.all.each do |pattern|
      expect(response.body).to include(pattern.name)
      expect(response.body).to have_link(pattern.name, href: patterns_path(selected: pattern.id))
    end
  end

  it "displays the description for a pattern" do
    pattern = Pattern.first
    get patterns_path(selected: pattern)
    expect(response.body).to include(pattern.description)
  end

  it "loads the relevant services for a pattern" do
    pattern = Pattern.first
    get patterns_path(selected: pattern)
    service = pattern.services.first
    expect(response.body).to include(service.name)
  end

end