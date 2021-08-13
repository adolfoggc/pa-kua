require 'rails_helper'

RSpec.describe "tuition_fees/show", type: :view do
  before(:each) do
    @tuition_fee = assign(:tuition_fee, TuitionFee.create!(
      weekly_classes: 2,
      fee: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
