require 'rails_helper'

RSpec.describe "belts/new", type: :view do
  before(:each) do
    assign(:belt, Belt.new(
      person: nil,
      modality: 1,
      color: 1
    ))
  end

  it "renders new belt form" do
    render

    assert_select "form[action=?][method=?]", belts_path, "post" do

      assert_select "input[name=?]", "belt[person_id]"

      assert_select "input[name=?]", "belt[modality]"

      assert_select "input[name=?]", "belt[color]"
    end
  end
end
