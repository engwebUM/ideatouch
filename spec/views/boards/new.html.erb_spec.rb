require 'rails_helper'

RSpec.describe "boards/new", type: :view do
  before(:each) do
    assign(:board, Board.new(
      :name => "MyString",
      :descricao => "MyText",
      :dynamic => nil
    ))
  end

  it "renders new board form" do
    render

    assert_select "form[action=?][method=?]", boards_path, "post" do

      assert_select "input#board_name[name=?]", "board[name]"

      assert_select "textarea#board_descricao[name=?]", "board[descricao]"

      assert_select "input#board_dynamic_id[name=?]", "board[dynamic_id]"
    end
  end
end
