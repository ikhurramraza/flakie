# frozen_string_literal: true

RSpec.describe "Flakie::VERSION" do
  subject(:version) { Flakie::VERSION }

  it "has a version number" do
    expect(version).to eq("2.0.0")
  end
end
