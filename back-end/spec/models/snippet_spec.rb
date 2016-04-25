require 'rails_helper'

RSpec.describe Snippet, type: :model do
  it "should validate the presence of name" do
    snippet = Snippet.new
    expect(snippet).to be_invalid
    expect(snippet.errors).to be_include(:name)
  end
end
