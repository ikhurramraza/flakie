# frozen_string_literal: true

module Flakie
  module CLI
    extend self

    def run(args)
      Runner.new(args).call
    end

    def exit_with_error(msg)
      warn(msg)
      exit 1
    end
  end
end
