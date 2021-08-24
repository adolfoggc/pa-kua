require 'rails_helper'

RSpec.describe "belts/index", type: :view do
  before(:each) do
    assign(:belts, [
      Belt.create!(
        person: nil,
        modality: 2,
        color: 3
      ),
      Belt.create!(
        person: nil,
        modality: 2,
        color: 3
      )
    ])
  end

  it "renders a list of belts" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
