require 'rails_helper'

RSpec.describe "participants/index", type: :view do
  before(:each) do
    assign(:participants, [
      Participant.create!(
        :email => "Email",
        :dynamic => nil
      ),
      Participant.create!(
        :email => "Email",
        :dynamic => nil
      )
    ])
  end

  it "renders a list of participants" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
