require 'rails_helper'

RSpec.describe "snippets/new", type: :view do
  before(:each) do
    assign(:snippet, Snippet.new(
      :name => "MyString",
      :contents => "MyText",
      :created_by => 1,
      :scope => "MyString",
      :tag_trigger => "MyString"
    ))
  end

  it "renders new snippet form" do
    render

    assert_select "form[action=?][method=?]", snippets_path, "post" do

      assert_select "input#snippet_name[name=?]", "snippet[name]"

      assert_select "textarea#snippet_contents[name=?]", "snippet[contents]"

      assert_select "input#snippet_created_by[name=?]", "snippet[created_by]"

      assert_select "input#snippet_scope[name=?]", "snippet[scope]"

      assert_select "input#snippet_tag_trigger[name=?]", "snippet[tag_trigger]"
    end
  end
end
