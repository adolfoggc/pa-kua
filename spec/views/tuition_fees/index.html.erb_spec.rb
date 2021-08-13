require 'rails_helper'

RSpec.describe "tuition_fees/index", type: :view do
  before(:each) do
    assign(:tuition_fees, [
      TuitionFee.create!(
        weekly_classes: 2,
        fee: 3
      ),
      TuitionFee.create!(
        weekly_classes: 2,
        fee: 3
      )
    ])
  end

  it "renders a list of tuition_fees" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
