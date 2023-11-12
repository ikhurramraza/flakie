# frozen_string_literal: true

module Flakie
  module CLI
    extend self

    def run(args)
      Runner.new(args).call
    end

    def fail(msg, show_help: true)
      warn("error: #{msg}")

      if show_help
        warn("")
        warn(Parser.help)
      end

      exit 1
    end
  end
end
