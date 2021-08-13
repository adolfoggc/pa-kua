require 'rails_helper'

RSpec.describe "discounts/index", type: :view do
  before(:each) do
    assign(:discounts, [
      Discount.create!(
        discount_percentage: "9.99",
        kind_of_plan: 2
      ),
      Discount.create!(
        discount_percentage: "9.99",
        kind_of_plan: 2
      )
    ])
  end

  it "renders a list of discounts" do
    render
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
