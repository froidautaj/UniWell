require 'rails_helper'

RSpec.describe "supports/edit", type: :view do
  let(:support) {
    Support.create!(
      name: "MyString",
      email: "MyString",
      phone_number: "MyString",
      message: "MyText"
    )
  }

  before(:each) do
    assign(:support, support)
  end

  it "renders the edit support form" do
    render

    assert_select "form[action=?][method=?]", support_path(support), "post" do

      assert_select "input[name=?]", "support[name]"

      assert_select "input[name=?]", "support[email]"

      assert_select "input[name=?]", "support[phone_number]"

      assert_select "textarea[name=?]", "support[message]"
    end
  end
end
