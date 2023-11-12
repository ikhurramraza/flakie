# frozen_string_literal: true

module Flakie
  module CLI
    Parser =
      OptionParser.new do |opts|
        opts.banner = "USAGE: #{PROGRAM_NAME} [OPTIONS] COMMAND"
        opts.separator ""

        opts.version = "#{PROGRAM_NAME} #{VERSION}"

        opts.separator "OPTIONS:"
        opts.on("-n", "--count COUNT", Integer, "Number of tries (default: #{Options.default.count})")

        opts.on("-f", "--format FORMATTER", "Output format. See FORMATTERS section below.") do |choice|
          Formatters::ALL.include?(choice.to_sym) ? choice.to_sym : CLI.exit_with_error("Invalid format: #{choice}")
        end

        opts.on("-o", "--output FILE", "File to output result. Defaults to STDOUT.") { |path| File.open(path, "w") }

        opts.on("-v", "--version", "Show the version")
        opts.on("-h", "--help", "Show this help message")
        opts.separator ""

        opts.separator "FORMATTERS:"
        opts.separator '  tictactoe - Outputs "o" for success and "x" for failures (default)'
        opts.separator ""

        opts.separator "EXAMPLES:"
        opts.separator "  #{PROGRAM_NAME} rails t test/foo_test.rb"
        opts.separator "  #{PROGRAM_NAME} -n10 rails t test/foo_test.rb"
        opts.separator "  #{PROGRAM_NAME} -count=10 rails t test/foo_test.rb"
      end
  end
end
