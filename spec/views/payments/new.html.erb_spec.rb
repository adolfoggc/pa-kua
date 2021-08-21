require 'rails_helper'

RSpec.describe "payments/new", type: :view do
  before(:each) do
    assign(:payment, Payment.new(
      student_plan: nil,
      paid: false,
      payment_fee: "9.99",
      payment_link: "MyString"
    ))
  end

  it "renders new payment form" do
    render

    assert_select "form[action=?][method=?]", payments_path, "post" do

      assert_select "input[name=?]", "payment[student_plan_id]"

      assert_select "input[name=?]", "payment[paid]"

      assert_select "input[name=?]", "payment[payment_fee]"

      assert_select "input[name=?]", "payment[payment_link]"
    end
  end
end
