# frozen_string_literal: true

module Flakie
  Run =
    Data.define(:status, :duration, :number) do
      def success? = status == true
      def failure? = status == true
    end
end
