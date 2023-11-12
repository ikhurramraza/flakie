# frozen_string_literal: true

module Flakie
  module CLI
    Options =
      Struct.new(:count, :format, :output, :help, :version) do
        def self.default = new(count: 5, format: :tictactoe, output: $stdout, help: false, version: false)
        def self.from(args) = default.tap { |options| Parser.parse!(args, into: options) }

        def formatter = Formatters::ALL.fetch(format)

        def help? = help
        def version? = version
      end
  end
end
