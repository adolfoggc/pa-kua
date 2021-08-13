require 'rails_helper'

RSpec.describe "tuition_fees/edit", type: :view do
  before(:each) do
    @tuition_fee = assign(:tuition_fee, TuitionFee.create!(
      weekly_classes: 1,
      fee: 1
    ))
  end

  it "renders the edit tuition_fee form" do
    render

    assert_select "form[action=?][method=?]", tuition_fee_path(@tuition_fee), "post" do

      assert_select "input[name=?]", "tuition_fee[weekly_classes]"

      assert_select "input[name=?]", "tuition_fee[fee]"
    end
  end
end
