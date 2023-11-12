# frozen_string_literal: true

module Flakie
  module CLI
    class Runner
      def initialize(args)
        @args = args
        @options = Options.from(args)
      end

      def call
        case options
        in help: true
          Parser.help.display
        in version: true
          Parser.version.display
        else
          Engine.new(args.join(" "), count: options.count, reporter: options.reporter.new(options.output)).run
        end
      end

      private

      attr_reader :options, :args
    end
  end
end
