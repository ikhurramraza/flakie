# frozen_string_literal: true

RSpec.describe "Flakie::CLI::Parser" do
  describe ".version" do
    subject(:version) { Flakie::CLI::Parser.version }

    it "returns the program name and version" do
      expect(version).to eq "#{Flakie::NAME} #{Flakie::VERSION}"
    end
  end

  describe ".help" do
    subject(:help) { Flakie::CLI::Parser.help }

    it "returns the help text" do
      expect(help).to eq(FixturesTestHelper.get("help.txt"))
    end
  end
end
