require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      :text => "MyString",
      :estado => false,
      :user => nil
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input#notification_text[name=?]", "notification[text]"

      assert_select "input#notification_estado[name=?]", "notification[estado]"

      assert_select "input#notification_user_id[name=?]", "notification[user_id]"
    end
  end
end
