# frozen_string_literal: true

module Flakie
  module Reporters
    class Base
      def initialize(output)
        @output = output
      end

      def open
        output.sync ||= true
      end

      def close
        output.close unless output.tty?
      end

      def report(_report)
        raise NotImplementedError, "Base class must implement this method"
      end

      private

      attr_reader :output
    end
  end
end
