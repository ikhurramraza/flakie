# frozen_string_literal: true

RSpec.describe Flakie::CLI::Options do
  describe ".default" do
    describe "help" do
      subject { described_class.default.help }

      it { is_expected.to be false }
    end

    describe "version" do
      subject { described_class.default.version }

      it { is_expected.to be false }
    end

    describe "count" do
      subject { described_class.default.count }

      it { is_expected.to be 5 }
    end

    describe "format" do
      subject { described_class.default.format }

      it { is_expected.to be :tictactoe }
    end

    describe "output" do
      subject { described_class.default.output }

      it { is_expected.to eq $stdout }
    end
  end

  describe ".from" do
    subject(:options) { described_class.from(args) }

    context "when no option is passed" do
      let(:args) { [] }

      it "returns default options" do
        expect(options).to eq(described_class.default)
      end
    end

    context "when --count option is passed" do
      let(:args) { %w[--count=10] }

      it "returns correct count value" do
        expect(options.count).to eq(10)
      end
    end

    context "when --output option is passed" do
      let(:args) { %w[--output=/tmp/result.txt] }

      it "returns correct count value" do
        expect(options.output).to be_a(File)
        expect(options.output.path).to eq("/tmp/result.txt")

        options.output.close
      end
    end

    context "when valid --format option is passed" do
      let(:args) { %w[--format=tictactoe] }

      it "returns correct count value" do
        expect(options.format).to eq :tictactoe
        expect(options.reporter).to eq Flakie::Reporters::TicTacToe
      end
    end

    context "when invalid --format option is passed" do
      let(:args) { %w[--format=1231] }

      it "exits the program with error message" do
        expect { options.format }.to raise_error(SystemExit).and(output(/error: Invalid format: 1231/).to_stderr)
      end
    end
  end
end
