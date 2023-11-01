# frozen_string_literal: true

module Flakie
  module CLI
    PROGRAM_NAME = "flakie"

    def self.run(args)
      Runner.new(args).call
    end

    def self.exit_with_error(msg)
      warn(msg)
      exit 1
    end
  end
end
