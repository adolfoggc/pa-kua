require 'rails_helper'

RSpec.describe "pakua_classes/edit", type: :view do
  before(:each) do
    @pakua_class = assign(:pakua_class, PakuaClass.create!(
      modality: 1,
      day_of_week: 1,
      hour: 1,
      minutes: 1,
      duration: 1
    ))
  end

  it "renders the edit pakua_class form" do
    render

    assert_select "form[action=?][method=?]", pakua_class_path(@pakua_class), "post" do

      assert_select "input[name=?]", "pakua_class[modality]"

      assert_select "input[name=?]", "pakua_class[day_of_week]"

      assert_select "input[name=?]", "pakua_class[hour]"

      assert_select "input[name=?]", "pakua_class[minutes]"

      assert_select "input[name=?]", "pakua_class[duration]"
    end
  end
end
