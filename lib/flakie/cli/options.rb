# frozen_string_literal: true

module Flakie
  module CLI
    Options =
      Struct.new(:count, :env, :format, :output, :help, :version) do
        def self.default = new(count: 5, env: {}, format: :tictactoe, output: $stdout, help: false, version: false)
        def self.from(args) = default.tap { |options| Parser.parse!(args, into: options) }

        def []=(key, value)
          if key == :env
            add_env(value)
          else
            super
          end
        end

        def add_env(raw)
          name, value = raw.split("=")
          CLI.exit_with_error("Bad env variable format: #{raw}") if name.nil? || value.nil?

          env[name] = value
        end

        def formatter = Formatters::ALL.fetch(format)

        def help? = help
        def version? = version
      end
  end
end
