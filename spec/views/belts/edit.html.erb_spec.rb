require 'rails_helper'

RSpec.describe "belts/edit", type: :view do
  before(:each) do
    @belt = assign(:belt, Belt.create!(
      person: nil,
      modality: 1,
      color: 1
    ))
  end

  it "renders the edit belt form" do
    render

    assert_select "form[action=?][method=?]", belt_path(@belt), "post" do

      assert_select "input[name=?]", "belt[person_id]"

      assert_select "input[name=?]", "belt[modality]"

      assert_select "input[name=?]", "belt[color]"
    end
  end
end
