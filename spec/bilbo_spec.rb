require "spec_helper"

RSpec.describe Bilbo do
  it "has a version number" do
    expect(Bilbo::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
