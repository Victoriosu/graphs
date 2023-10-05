require 'rails_helper'

RSpec.describe "graphs/show", type: :view do
  before(:each) do
    assign(:graph, Graph.create!(
      name: "Name",
      list_order: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
