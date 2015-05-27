require 'rails_helper'

RSpec.describe "votes/new", type: :view do
  before(:each) do
    assign(:vote, Vote.new(
      :participant => nil,
      :dynamic => nil,
      :note => nil
    ))
  end

  it "renders new vote form" do
    render

    assert_select "form[action=?][method=?]", votes_path, "post" do

      assert_select "input#vote_participant_id[name=?]", "vote[participant_id]"

      assert_select "input#vote_dynamic_id[name=?]", "vote[dynamic_id]"

      assert_select "input#vote_note_id[name=?]", "vote[note_id]"
    end
  end
end
