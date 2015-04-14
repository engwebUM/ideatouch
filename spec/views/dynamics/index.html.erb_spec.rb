require 'rails_helper'

RSpec.describe "dynamics/index", type: :view do
  before(:each) do
    assign(:dynamics, [
      Dynamic.create!(
        :name => "Name",
        :descricao => "MyText"
      ),
      Dynamic.create!(
        :name => "Name",
        :descricao => "MyText"
      )
    ])
  end

  it "renders a list of dynamics" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
