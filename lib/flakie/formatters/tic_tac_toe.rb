# frozen_string_literal: true

module Flakie
  module Formatters
    class TicTacToe < Base
      CHARACTER_SUCCESS = "o"
      CHARACTER_FAILURE = "x"
      CHARACTER_SUCCESS_COLORED = "\e[32m#{CHARACTER_SUCCESS}\e[0m".freeze
      CHARACTER_FAILURE_COLORED = "\e[31m#{CHARACTER_FAILURE}\e[0m".freeze
      CHARACTER_NEWLINE = "\n"

      def open
      end

      def report(report)
        report.last_run.success? ? report_success : report_failure
      end

      def close
        output.puts(CHARACTER_NEWLINE)
        super
      end

      private

      def report_success
        character = output.tty? ? CHARACTER_SUCCESS_COLORED : CHARACTER_SUCCESS
        output.write(character)
      end

      def report_failure
        character = output.tty? ? CHARACTER_FAILURE_COLORED : CHARACTER_FAILURE
        output.write(character)
      end
    end
  end
end
