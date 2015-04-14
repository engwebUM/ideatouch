require 'rails_helper'

RSpec.describe "dynamics/show", type: :view do
  before(:each) do
    @dynamic = assign(:dynamic, Dynamic.create!(
      :name => "Name",
      :descricao => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
