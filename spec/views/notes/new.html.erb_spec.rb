require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    assign(:note, Note.new(
      :board => nil,
      :text => "MyText"
    ))
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do

      assert_select "input#note_board_id[name=?]", "note[board_id]"

      assert_select "textarea#note_text[name=?]", "note[text]"
    end
  end
end
