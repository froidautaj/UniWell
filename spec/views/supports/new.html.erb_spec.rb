require 'rails_helper'

RSpec.describe "supports/new", type: :view do
  before(:each) do
    assign(:support, Support.new(
      name: "MyString",
      email: "MyString",
      phone_number: "MyString",
      message: "MyText"
    ))
  end

  it "renders new support form" do
    render

    assert_select "form[action=?][method=?]", supports_path, "post" do

      assert_select "input[name=?]", "support[name]"

      assert_select "input[name=?]", "support[email]"

      assert_select "input[name=?]", "support[phone_number]"

      assert_select "textarea[name=?]", "support[message]"
    end
  end
end
