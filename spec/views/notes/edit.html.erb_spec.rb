require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :board => nil,
      :text => "MyText"
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "input#note_board_id[name=?]", "note[board_id]"

      assert_select "textarea#note_text[name=?]", "note[text]"
    end
  end
end
