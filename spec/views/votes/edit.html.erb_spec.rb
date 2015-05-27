require 'rails_helper'

RSpec.describe "votes/edit", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :participant => nil,
      :dynamic => nil,
      :note => nil
    ))
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do

      assert_select "input#vote_participant_id[name=?]", "vote[participant_id]"

      assert_select "input#vote_dynamic_id[name=?]", "vote[dynamic_id]"

      assert_select "input#vote_note_id[name=?]", "vote[note_id]"
    end
  end
end
