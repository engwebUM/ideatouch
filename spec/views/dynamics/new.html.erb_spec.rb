require 'rails_helper'

RSpec.describe "dynamics/new", type: :view do
  before(:each) do
    assign(:dynamic, Dynamic.new(
      :name => "MyString",
      :descricao => "MyText"
    ))
  end

  it "renders new dynamic form" do
    render

    assert_select "form[action=?][method=?]", dynamics_path, "post" do

      assert_select "input#dynamic_name[name=?]", "dynamic[name]"

      assert_select "textarea#dynamic_descricao[name=?]", "dynamic[descricao]"
    end
  end
end
