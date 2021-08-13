require 'rails_helper'

RSpec.describe "rents/index", type: :view do
  before(:each) do
    assign(:rents, [
      Rent.create!(
        rental_amount: "9.99"
      ),
      Rent.create!(
        rental_amount: "9.99"
      )
    ])
  end

  it "renders a list of rents" do
    render
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
