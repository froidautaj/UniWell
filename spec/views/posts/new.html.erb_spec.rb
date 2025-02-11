require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      title: "MyString",
      content: "MyText",
      tags: "MyString",
      user: nil,
      category: nil
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[content]"

      assert_select "input[name=?]", "post[tags]"

      assert_select "input[name=?]", "post[user_id]"

      assert_select "input[name=?]", "post[category_id]"
    end
  end
end
