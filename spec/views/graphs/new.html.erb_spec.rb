require 'rails_helper'

RSpec.describe "graphs/new", type: :view do
  before(:each) do
    assign(:graph, Graph.new(
      name: "MyString",
      list_order: 1
    ))
  end

  it "renders new graph form" do
    render

    assert_select "form[action=?][method=?]", graphs_path, "post" do

      assert_select "input[name=?]", "graph[name]"

      assert_select "input[name=?]", "graph[list_order]"
    end
  end
end
