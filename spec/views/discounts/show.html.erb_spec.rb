require 'rails_helper'

RSpec.describe "discounts/show", type: :view do
  before(:each) do
    @discount = assign(:discount, Discount.create!(
      discount_percentage: "9.99",
      kind_of_plan: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
  end
end
