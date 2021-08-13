require 'rails_helper'

RSpec.describe "rents/show", type: :view do
  before(:each) do
    @rent = assign(:rent, Rent.create!(
      rental_amount: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
  end
end
