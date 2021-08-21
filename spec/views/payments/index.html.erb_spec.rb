require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        student_plan: nil,
        paid: false,
        payment_fee: "9.99",
        payment_link: "Payment Link"
      ),
      Payment.create!(
        student_plan: nil,
        paid: false,
        payment_fee: "9.99",
        payment_link: "Payment Link"
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Payment Link".to_s, count: 2
  end
end
