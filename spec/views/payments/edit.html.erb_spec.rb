require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      student_plan: nil,
      paid: false,
      payment_fee: "9.99",
      payment_link: "MyString"
    ))
  end

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do

      assert_select "input[name=?]", "payment[student_plan_id]"

      assert_select "input[name=?]", "payment[paid]"

      assert_select "input[name=?]", "payment[payment_fee]"

      assert_select "input[name=?]", "payment[payment_link]"
    end
  end
end
