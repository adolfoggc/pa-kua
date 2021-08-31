require 'rails_helper'

RSpec.describe "pakua_classes/show", type: :view do
  before(:each) do
    @pakua_class = assign(:pakua_class, PakuaClass.create!(
      modality: 2,
      day_of_week: 3,
      hour: 4,
      minutes: 5,
      duration: 6
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
