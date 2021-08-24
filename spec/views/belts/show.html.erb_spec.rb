require 'rails_helper'

RSpec.describe "belts/show", type: :view do
  before(:each) do
    @belt = assign(:belt, Belt.create!(
      person: nil,
      modality: 2,
      color: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
