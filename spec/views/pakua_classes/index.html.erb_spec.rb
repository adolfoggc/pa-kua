require 'rails_helper'

RSpec.describe "pakua_classes/index", type: :view do
  before(:each) do
    assign(:pakua_classes, [
      PakuaClass.create!(
        modality: 2,
        day_of_week: 3,
        hour: 4,
        minutes: 5,
        duration: 6
      ),
      PakuaClass.create!(
        modality: 2,
        day_of_week: 3,
        hour: 4,
        minutes: 5,
        duration: 6
      )
    ])
  end

  it "renders a list of pakua_classes" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
  end
end
