require 'rails_helper'

RSpec.describe "participants/edit", type: :view do
  before(:each) do
    @participant = assign(:participant, Participant.create!(
      :email => "MyString",
      :dynamic => nil
    ))
  end

  it "renders the edit participant form" do
    render

    assert_select "form[action=?][method=?]", participant_path(@participant), "post" do

      assert_select "input#participant_email[name=?]", "participant[email]"

      assert_select "input#participant_dynamic_id[name=?]", "participant[dynamic_id]"
    end
  end
end
