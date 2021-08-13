require 'rails_helper'

RSpec.describe "discounts/new", type: :view do
  before(:each) do
    assign(:discount, Discount.new(
      discount_percentage: "9.99",
      kind_of_plan: 1
    ))
  end

  it "renders new discount form" do
    render

    assert_select "form[action=?][method=?]", discounts_path, "post" do

      assert_select "input[name=?]", "discount[discount_percentage]"

      assert_select "input[name=?]", "discount[kind_of_plan]"
    end
  end
end
