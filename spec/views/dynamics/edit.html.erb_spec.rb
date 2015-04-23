require 'rails_helper'

RSpec.describe "dynamics/edit", type: :view do
  before(:each) do
    @dynamic = assign(:dynamic, Dynamic.create!(
      :name => "MyString",
      :descricao => "MyText"
    ))
  end

  it "renders the edit dynamic form" do
    render

    assert_select "form[action=?][method=?]", dynamic_path(@dynamic), "post" do

      assert_select "input#dynamic_name[name=?]", "dynamic[name]"

      assert_select "textarea#dynamic_descricao[name=?]", "dynamic[descricao]"
    end
  end
end
