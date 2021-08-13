require 'rails_helper'

RSpec.describe "tuition_fees/new", type: :view do
  before(:each) do
    assign(:tuition_fee, TuitionFee.new(
      weekly_classes: 1,
      fee: 1
    ))
  end

  it "renders new tuition_fee form" do
    render

    assert_select "form[action=?][method=?]", tuition_fees_path, "post" do

      assert_select "input[name=?]", "tuition_fee[weekly_classes]"

      assert_select "input[name=?]", "tuition_fee[fee]"
    end
  end
end
