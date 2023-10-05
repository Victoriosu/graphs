require 'rails_helper'

RSpec.describe "graphs/edit", type: :view do
  let(:graph) {
    Graph.create!(
      name: "MyString",
      list_order: 1
    )
  }

  before(:each) do
    assign(:graph, graph)
  end

  it "renders the edit graph form" do
    render

    assert_select "form[action=?][method=?]", graph_path(graph), "post" do

      assert_select "input[name=?]", "graph[name]"

      assert_select "input[name=?]", "graph[list_order]"
    end
  end
end
