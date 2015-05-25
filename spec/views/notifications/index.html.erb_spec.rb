require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :text => "Text",
        :estado => false,
        :user => nil
      ),
      Notification.create!(
        :text => "Text",
        :estado => false,
        :user => nil
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
