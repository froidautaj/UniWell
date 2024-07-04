require 'rails_helper'

RSpec.describe "supports/show", type: :view do
  before(:each) do
    assign(:support, Support.create!(
      name: "Name",
      email: "Email",
      phone_number: "Phone Number",
      message: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/MyText/)
  end
end
